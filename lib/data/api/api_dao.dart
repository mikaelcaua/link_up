import 'package:dio/dio.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/utils/api/api_utils.dart';
class ApiDao {
  final apiDaoDio = Dio();
  
  Future<List<PostModel>> getPostsByFollowers(int id) async{
    return ((apiDaoDio.get("$clientsUrl$id") as List<dynamic>).map((e)=> e as PostModel)).toList();
  }
}