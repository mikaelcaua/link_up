import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/domains/models/user_model.dart';

abstract class ApiWorkflow {
  Future<List<PostModel>> getUserPosts(String userSurname);
  Future<UserModel> getUser(String userSurname);
  Future<List<PostModel>> getFollowersPosts(String userSurname);
}