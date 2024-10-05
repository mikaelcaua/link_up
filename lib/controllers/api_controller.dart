import 'package:link_up/data/api/api_dao.dart';
import 'package:link_up/domains/business/api_workflow.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/domains/models/user_model.dart';

class ApiController implements ApiWorkflow{
  final _apiDao = ApiDao();

  @override
  Future<List<PostModel>> getUserPosts(int userId) async{
    return await _apiDao.getUserPostsData(userId);
  }

  @override
  Future<UserModel> getUser(int userId) async{
    return await _apiDao.getUserData(userId);
  }
  
  @override
  Future<List<PostModel>> getFollowersPosts(int userId) async{
    return await _apiDao.getFollowersPostsData(userId);
  }
  
}