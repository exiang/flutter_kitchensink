library file_session_manager;

import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileSessionManager {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // For your reference print the AppDoc directory
    return directory.path;
  }

  Future<File> getLocalFile(key) async {
    final path = await _localPath;
    return File('$path/$key');
  }

  Future<DateTime> lastModified(key) async {
    final file = await getLocalFile(key);
    return file.lastModified();
  }

  Future<bool> exists(key) async {
    final file = await getLocalFile(key);
    return file.exists();
  }

  Future<File> write(key, value) async {
    final file = await getLocalFile(key);
    // Write the file
    //print('writeContent: ' + value);
    return file.writeAsString(value);
  }

  Future<String> read(key) async {
    try {
      final file = await getLocalFile(key);
      if (await file.exists()) {
        //print('file exists');
        // Read the file
        String contents = await file.readAsString();
        print('read:' + contents);
        return contents;
      } else {
        //print('file not exists');
        await file.writeAsString('0');
        return '0';
      }
    } catch (e) {
      // If there is an error reading, return a default String
      return e.toString();
    }
  }
}
