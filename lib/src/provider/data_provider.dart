import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_kitchensink/src/model/user_model.dart';
import 'package:flutter_kitchensink/src/service/user_service.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.read(apiProvider).getUsers();
});
