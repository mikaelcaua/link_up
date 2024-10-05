import 'package:flutter/material.dart';
import 'package:link_up/provider/post_provider.dart';
import 'package:link_up/presentation/components/post/list_post_component.dart';
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
          return ListPostComponent(posts: posts.list);
        },
      ),
    );
  }
}
