import 'package:flutter/material.dart';
import 'package:link_up/controllers/api_controller.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'provider/post_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: ApiController().getFollowersPosts(1), 
        builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()), 
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Erro ao carregar dados: ${snapshot.error}')),
            );
          } else {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => Posts(list: snapshot.data!), 
                ),
              ],
              child: HomeScreen(),  // Seu widget principal
            );
          }
        },
      ),
    );
  }
}
