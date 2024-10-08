import 'package:flutter/material.dart';
import 'package:link_up/utils/theme/link_up_colors.dart';

class PostComponent extends StatelessWidget {
  PostComponent({super.key, required this.description, required this.img});
  String img;
  String description;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: LinkUpColors().AppBarBackGround,
        ),
        child: Column(
          children: [
            Image.network(img),
            Text(description)
          ],
        ),
      ),
    );
  }
}