import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/domains/models/user_model.dart';

abstract class ApiWorkflow {
  Future<List<PostModel>> getUserPosts(int userId);
  Future<UserModel> getUser(int userId);
}