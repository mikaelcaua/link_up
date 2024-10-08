import 'dart:convert';

class PostModel {
  int id;
  String description;
  String userSurname;
  String imgPost;

  PostModel({
    required this.id,
    required this.description,
    required this.userSurname,
    required this.imgPost,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'userSurname': userSurname,
      'imgPost': imgPost,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    print('chegou postmodelmap');
    return PostModel(
      id: int.parse(map['id']),
      description: map['description'],
      userSurname: map['userSurname'],
      imgPost: map['imgPost'],
    );
  }

  static List<PostModel> convertFromListPost(List<dynamic> data) {
    return data.map((e) => PostModel.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(id: $id, description: $description, userId: $userSurname, imgPost: $imgPost)';
  }
}
