import 'package:flutter/material.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/screens/components/post_component.dart';

class ListPostComponent extends StatefulWidget {
  ListPostComponent({super.key, required this.posts});
  List<PostModel> posts;

  @override
  State<ListPostComponent> createState() => _ListPostComponentState();
}

class _ListPostComponentState extends State<ListPostComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: widget.posts.length,
            itemBuilder: (context, index) {
              return PostComponent(description: widget.posts[index].description, img: widget.posts[index].description);
            },
          );;
  }
}