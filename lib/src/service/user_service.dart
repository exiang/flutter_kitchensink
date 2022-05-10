import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_kitchensink/src/model/user_model.dart';

class ApiService {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    final _prefs = await SharedPreferences.getInstance();

    try {
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['data'];
        _prefs.setString('post', jsonEncode(result));
        return result.map(((e) => UserModel.fromJson(e))).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (errs) {
      log('loading from cache');
      final List result = json.decode(_prefs.getString('post')!);
      return result.map((e) => UserModel.fromJson(e)).toList();
    }
  }
}

//API SERVICE Provider
final apiProvider = Provider<ApiService>((ref) => ApiService());
