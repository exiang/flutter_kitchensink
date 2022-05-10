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
}
