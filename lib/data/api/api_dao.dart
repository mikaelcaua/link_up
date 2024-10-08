import 'package:dio/dio.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/domains/models/user_model.dart';
import 'package:link_up/utils/api/api_utils.dart';

//fazer tratamento adequado de exceções
//muitas coisas podem ser melhoradas, não está nada eficiente
class ApiDao {
  final Dio apiDaoDio = Dio();

  Future<UserModel> getUserData(String userSurname) async {
    Response response = await apiDaoDio.get(specificUserUrl+userSurname);
    return UserModel.fromMap(response.data[0]);
  }

  Future<List<PostModel>> getUserPostsData(String userSurname) async {
    Response response = await apiDaoDio.get(specificUserPostsUrl+userSurname);
    List<PostModel> posts = PostModel.convertFromListPost(response.data);
    return posts;
  }

  Future<List<PostModel>> getFollowersPostsData(String userSurname) async {
    UserModel userData = await getUserData(userSurname);
    List<String> followers = userData.followers;

    Response response = await apiDaoDio.get(postsUrl);
    List<dynamic> data = response.data;

    List<PostModel> posts = data
        .map((e) => PostModel.fromMap(e))
        .where((post) => followers.contains(post.userSurname))
        .toList();
    return posts;
  }
}
