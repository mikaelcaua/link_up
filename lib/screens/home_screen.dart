import 'package:flutter/material.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/provider/post_provider.dart';
import 'package:link_up/screens/components/post_component.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinkUp'),
      ),
      body: Consumer(
        builder: (context, Posts posts, Widget? widget) {
          return ListView.builder(
            itemCount: posts.list.length,
            itemBuilder: (context, index) {
              return PostComponent(description: posts.list[index].description, img: posts.list[index].description);
            },
          );
        },
      ),
    );
  }
}
