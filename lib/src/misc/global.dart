import 'dart:async';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:intl/intl.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'file_session_manager.dart';

final kCounterProvider = StateProvider((ref) => 0);

//
// file session manager
Future<String> readFileSession(key) async {
  return await FileSessionManager().read(key);
}

Future<File> writeFileSession(key, value) async {
  return await FileSessionManager().write(key, value);
}

//
// session manager
Future setSession(key, value) async {
  return await SessionManager().set(key, value);
}

Future<dynamic> getSession(key, defaultValue) async {
  if (!await SessionManager().containsKey(key)) {
    return await SessionManager()
        .set(key, defaultValue)
        .then(await SessionManager().get(key));
  }

  return await SessionManager().get(key);
}
