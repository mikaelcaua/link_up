import 'package:dio/dio.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/domains/models/user_model.dart';
import 'package:link_up/utils/api/api_utils.dart';

//fazer tratamento adequado de exceções
//muitas coisas podem ser melhoradas, não está nada eficiente
class ApiDao {
  final Dio apiDaoDio = Dio();

  Future<UserModel> getUserData(String userSurname) async {
    Response response = await apiDaoDio.get(usersUrl);
    List<dynamic> users = response.data;

    for (dynamic user in users) {
      if (user['surname'] == userSurname) {
        print(user);
        return UserModel.fromMap(user);
      }
    }
    throw Exception('User not Found');
  }

  Future<List<PostModel>> getUserPostsData(String userSurname) async {
    Response response = await apiDaoDio.get(postsUrl);

    List<dynamic> data = response.data;

    //melhorar essas funções de filtro
    List<PostModel> posts = data
        .map((e) => PostModel.fromMap(e))
        .where((post) => post.userSurname == userSurname)
        .toList();

    return posts;
  }

  Future<List<PostModel>> getFollowersPostsData(String userSurname) async {
    UserModel userData = await getUserData(userSurname);
    List<String> followers = userData.followers;
    print('chegou em fpllwoers');
    Response response = await apiDaoDio.get(postsUrl);
    List<dynamic> data = response.data;
    print(data);
    //melhorar essa função de filtro
    List<PostModel> posts = data
        .map((e) => PostModel.fromMap(e))
        .where((post) => followers.contains(post.userSurname))
        .toList();

    return posts;
  }
}
