import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_kitchensink/src/model/user_model.dart';
import 'package:flutter_kitchensink/src/service/user_service.dart';

final userDataProvider = StateNotifierProvider<UserList, ListOfUserModel>(
  (ref) {
    return UserList(ListOfUserModel(data: []));
  },
);

class UserList extends StateNotifier<ListOfUserModel> {
  UserList(ListOfUserModel initialTodos)
      : super(
          initialTodos,
        );

  void overrideData(ListOfUserModel listOfUserModel) {
    if (listOfUserModel.data.isNotEmpty) {
      state = listOfUserModel;
    }
  }

  void saveData() {
    //sharedUtility.saveSharedTodoData(state);
  }

  void loadData(ref) async {
    ApiService.getUsers().then((val) => state.data = val);
  }

  /// Adds a new [UserModel] to the list.
  void add(
      int id, String email, String firstname, String lastname, String avatar) {
    state = ListOfUserModel(data: [
      ...state.data,
      UserModel(
          id: id,
          email: email,
          firstname: firstname,
          lastname: lastname,
          avatar: avatar),
    ]);
    saveData();
  }

  /// Edit the description of [UserModel].
  void edit({required int id, required String firstname}) {
    state = ListOfUserModel(data: [
      for (final user in state.data)
        if (user.id == id)
          UserModel(
              id: user.id,
              email: user.email,
              firstname: firstname,
              lastname: user.lastname,
              avatar: user.avatar)
        else
          user,
    ]);
    saveData();
  }

  /// Removes a [UserModel] from the list.
  void remove(UserModel target) {
    state = ListOfUserModel(
        data: state.data.where((user) => user.id != target.id).toList());

    saveData();
  }
}
