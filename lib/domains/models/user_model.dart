import 'dart:convert';

class UserModel {
  String name;
  String surname;
  List<String> followers;
  String userImg;

  UserModel({
    required this.name,
    required this.surname,
    required this.followers,
    required this.userImg
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'followers': followers,
      'userImg':userImg
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      surname: map["surname"],
      followers: List<String>.from(map["followers"]),
      userImg:map["userImg"] 
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel( name: $name, surname: $surname, followers: $followers, img:$userImg)';
  }
}
