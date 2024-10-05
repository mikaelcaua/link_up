import 'package:flutter/material.dart';
import 'package:link_up/controllers/api_controller.dart';

void main() async{
  runApp(const MyApp());
  print(await ApiController().getUserPosts(1));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}

