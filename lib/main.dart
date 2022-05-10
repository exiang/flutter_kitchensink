import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_kitchensink/src/screen/menu_screen.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    title: 'Kitchensink',
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.dark,
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MenuScreen(),
    },
  )));
}
