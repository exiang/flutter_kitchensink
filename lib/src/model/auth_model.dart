import 'package:flutter/foundation.dart';

@immutable
class Auth {
  final int userId;
  final String email;
  final String username;
  final String nickname;
  /*late String timezone;
  late String language;
  late String currency;
  late String avatarUrl;

  late bool isLogin = false;
  late String provider;
  late String providerIdentifier;
  late String jwt;
  late String refreshToken;
  late int tokenExp;*/

  const Auth(
      {required this.userId,
      required this.email,
      required this.username,
      required this.nickname});

  Auth copyWith(
      {int? userId, String? email, String? username, String? nickname}) {
    return Auth(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      username: username ?? this.username,
      nickname: nickname ?? this.nickname,
    );
  }
}
