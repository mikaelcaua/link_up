import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  PostComponent({super.key, required this.description, required this.img});
  String img;
  String description;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(img),
          Text(description)
        ],
      ),
    );
  }
}