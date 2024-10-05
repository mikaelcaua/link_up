import 'package:flutter/material.dart';

class PostComponent extends StatefulWidget {
  PostComponent({super.key, required this.description, required this.img});
  String img;
  String description;


  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(widget.img),
          Text(widget.description)
        ],
      ),
    );
  }
}