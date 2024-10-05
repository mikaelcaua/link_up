import 'package:link_up/domains/models/post_model.dart';

abstract class ApiWorkflow {
  Future<List<PostModel>> getPostsByFollowers(int userId);
}