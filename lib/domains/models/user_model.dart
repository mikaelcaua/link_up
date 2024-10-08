import 'dart:convert';

class UserModel {
  String name;
  String surname;
  List<String> followers;

  UserModel({
    required this.name,
    required this.surname,
    required this.followers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'followers': followers,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    print('chegou em from map');
    return UserModel(
      name: map["name"],
      surname: map["surname"],
      followers: List<String>.from(map["followers"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel( name: $name, surname: $surname, followers: $followers)';
  }
}
