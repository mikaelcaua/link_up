
import 'package:flutter/material.dart';

import 'package:link_up/domains/models/post_model.dart';

class Posts extends ChangeNotifier {
List<PostModel> list;
  Posts({
    required this.list,
  });
  
  void setPosts(List<PostModel> newPosts){
    list = newPosts;
  }
    
}
