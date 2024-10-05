import 'package:link_up/data/api/api_dao.dart';
import 'package:link_up/domains/business/api_workflow.dart';
import 'package:link_up/domains/models/post_model.dart';

class ApiController implements ApiWorkflow{
  final _apiDao = ApiDao();

  @override
  Future<List<PostModel>> getPostsByFollowers(int userId) async{
    return _apiDao.getPostsByFollowers(userId);
  }
  
}