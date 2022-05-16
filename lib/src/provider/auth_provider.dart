import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_kitchensink/src/model/auth_model.dart';

class AuthNotifier extends StateNotifier<Auth> {
  AuthNotifier()
      : super(Auth(userId: 0, email: '', username: '', nickname: ''));

  void setNickname(value) {
    state = state.copyWith(nickname: value);
  }
}

final StateNotifierProvider<AuthNotifier, Auth> authDataProvider =
    StateNotifierProvider((ref) => AuthNotifier());
