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
      id: map['id'] as int,
      name: map['name'] as String,
      surname: map['surname'] as String,
      followers: ((map['followers'] as List<dynamic>).map((e) => e as int)).toList(),
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
