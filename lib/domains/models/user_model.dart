import 'dart:convert';

class UserModel {
  int id;
  String name;
  String surname;
  List<int> followers;

  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.followers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'surname': surname,
      'followers': followers,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: int.parse(map["id"]),
      name: map["name"],
      surname: map["surname"],
      followers: List<int>.from(map["followers"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, surname: $surname, followers: $followers)';
  }
}
