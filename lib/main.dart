import 'package:flutter/material.dart';
import 'package:link_up/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'provider/post_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Posts(list: [])),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
