import 'package:flutter/material.dart';
import 'package:flutter_kitchensink/src/screen/default_counter_screen.dart';
import 'package:flutter_kitchensink/src/screen/riverpod_screen.dart';
import 'package:flutter_kitchensink/src/screen/riverpod2_screen.dart';

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
              title: Text("Default Counter (stateful)"),
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
              title: Text("Riverpod"),
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
              title: Text("Riverpod2"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Riverpod2Screen(),
                  ),
                );
              },
            ),
            ListTile(title: Text("Another Item"))
          ],
        ));
  }
}
