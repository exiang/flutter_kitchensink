// https://reqres.in/api/users?page=2
class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstname: json['first_name'] ?? 'First Name',
        lastname: json['last_name'] ?? 'Last Name',
        avatar: json['avatar'] ?? 'https://i.pravatar.cc/300');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["email"] = email;
    data["firstname"] = firstname;
    data["lastname"] = lastname;
    data["avatar"] = avatar;
    return data;
  }
}

class ListOfUserModel {
  late List<UserModel> data;

  ListOfUserModel({
    required this.data,
  });
  ListOfUserModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] != null) {
      final v = json["data"];
      final arr0 = <UserModel>[];
      v.forEach((v) {
        arr0.add(UserModel.fromJson(v));
      });
      data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    final v = this.data;
    final arr0 = [];
    for (var v in v) {
      arr0.add(v.toJson());

      data["data"] = arr0;
    }
    return data;
  }
}
