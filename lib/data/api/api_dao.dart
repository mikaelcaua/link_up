import 'package:dio/dio.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/domains/models/user_model.dart';
import 'package:link_up/utils/api/api_utils.dart';

class ApiDao {
  final Dio apiDaoDio = Dio();
  
  Future<UserModel> getUserData(int userId) async{
    Response response = await apiDaoDio.get("$clientsUrl$userId");
    UserModel user = response.data as UserModel;
    return user;
  }

  Future<List<PostModel>> getUserPostsData(int userId) async {
      Response response = await apiDaoDio.get(postsUrl);
      
      List<dynamic> data = response.data;
    
      List<PostModel> posts = data
          .map((e) => PostModel.fromMap(e))  
          .where((post) => post.userId == userId)  
          .toList();

      return posts;
  }
}
