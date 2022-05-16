import 'package:flutter/material.dart';

import 'package:flutter_kitchensink/src/misc/global.dart' as global;

import 'package:flutter_kitchensink/src/screen/default_counter_screen.dart';
import 'package:flutter_kitchensink/src/screen/session1_screen.dart';
import 'package:flutter_kitchensink/src/screen/session2_screen.dart';
import 'package:flutter_kitchensink/src/screen/riverpod_screen.dart';
import 'package:flutter_kitchensink/src/screen/riverpod2_screen.dart';
import 'package:flutter_kitchensink/src/screen/riverpod_user_screen.dart';
import 'package:flutter_kitchensink/src/screen/riverpod_auth_screen.dart';
import 'package:flutter_kitchensink/src/screen/riverpod_auth_protected_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kitchensink Menu'),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10.0),
          children: [
            ListTile(
              title: Text("Counter"),
              subtitle: Text('Flutter default counter demo + stateful widget'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DefaultCounterScreen(
                        title: "Default Counter by Flutter"),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Session Page 1"),
              subtitle: Text(
                  "SharedPref + File Storage, changes sync across pages & stored persistantly"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Session1Screen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Session Page 2"),
              subtitle: Text(
                  "SharedPref + File Storage, changes sync across pages & stored  stored persistantly"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Session2Screen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Riverpod Page 1"),
              subtitle: Text(
                  "1st test page, stateful widget replacement, changes here sync across all pages"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiverpodScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Riverpod Page 2"),
              subtitle: Text(
                  "2nd test page, stateful widget replacement, changes here sync across all pages"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Riverpod2Screen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Riverpod Users"),
              subtitle: Text("List + BottomSheet + HTTP GET"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiverpodUserScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Riverpod Auth"),
              subtitle: Text("Global editable state + StateNotifierProvider"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiverpodAuthScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Riverpod Auth - Protected page"),
              subtitle: Text("Global editable state + StateNotifierProvider"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiverpodAuthProtectedScreen(),
                  ),
                );
              },
            ),
            ListTile(title: Text("Another Item"))
          ],
        ));
  }
}
