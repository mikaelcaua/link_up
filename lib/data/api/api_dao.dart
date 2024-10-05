import 'package:dio/dio.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/domains/models/user_model.dart';
import 'package:link_up/utils/api/api_utils.dart';

class ApiDao {
  final Dio apiDaoDio = Dio();
  
  Future<UserModel> getUserData(int userId) async{
    Response response = await apiDaoDio.get("$usersUrl");
    List<dynamic> users = response.data;
    for(dynamic user in users){
      if(user['id'] == userId){
        return UserModel.fromMap(user);
      }
    }
    return UserModel(id: 0, name: "Error", surname: "Error", followers: []);
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

  Future<List<PostModel>> getFollowersPostsData(int userId) async{
    UserModel userData = await getUserData(userId);
    List<int> followers = userData.followers;
    Response response = await apiDaoDio.get(postsUrl);
      
    List<dynamic> data = response.data;
    
    List<PostModel> posts = data
        .map((e) => PostModel.fromMap(e))  
        .where((post) => followers.contains(post.userId))  
        .toList();

    return posts;
  }


}
