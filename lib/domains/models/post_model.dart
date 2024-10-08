import 'dart:convert';

class PostModel {
  int id;
  String description;
  int userId;
  String imgPost;

  PostModel({
    required this.id,
    required this.description,
    required this.userId,
    required this.imgPost,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'userId': userId,
      'imgPost': imgPost,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: int.parse(map['id']),
      description: map['description'],
      userId: map['userId'],
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
    return 'PostModel(id: $id, description: $description, userId: $userId, imgPost: $imgPost)';
  }
}
