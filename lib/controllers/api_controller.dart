import 'package:link_up/data/api/api_dao.dart';
import 'package:link_up/domains/business/api_workflow.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/domains/models/user_model.dart';

class ApiController implements ApiWorkflow{
  final _apiDao = ApiDao();

  @override
  Future<List<PostModel>> getUserPosts(String userSurname) async{
    return await _apiDao.getUserPostsData(userSurname);
  }

  @override
  Future<UserModel> getUser(String userSurname) async{
    return await _apiDao.getUserData(userSurname);
  }
  
  @override
  Future<List<PostModel>> getFollowersPosts(String userSurname) async{
    return await _apiDao.getFollowersPostsData(userSurname);
  }
  
}