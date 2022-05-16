import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:intl/intl.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'file_session_manager.dart';

final kCounterProvider = StateProvider((ref) => 0);
final _accountNameController =
    TextEditingController(text: 'flutter_secure_storage_service');

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

//
// secure session manager
Future setSecureSession(key, value) async {
  final storage = getSecureStorage();
  return await storage.write(key: key, value: value.toString());
}

Future<dynamic> getSecureSession(key, defaultValue) async {
  final storage = getSecureStorage();
  if (!await storage.containsKey(key: key)) {
    await storage.write(key: key, value: defaultValue).then(
      (value) {
        return storage.read(key: key);
      },
    );
  }

  return await storage.read(key: key);
}

FlutterSecureStorage getSecureStorage() {
  return FlutterSecureStorage(
      iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
}

IOSOptions _getIOSOptions() => IOSOptions(
      accountName: _accountNameController.text.isEmpty
          ? null
          : _accountNameController.text,
    );

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
