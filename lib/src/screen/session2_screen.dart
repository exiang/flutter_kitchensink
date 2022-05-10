import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_kitchensink/src/misc/global.dart' as global;
import 'package:flutter_kitchensink/src/screen/session1_screen.dart';

class Session2Screen extends StatefulWidget {
  @override
  _Session2ScreenState createState() => _Session2ScreenState();
}

class _Session2ScreenState extends State<Session2Screen> {
  int counter = 0;

  @override
  void initState() {
    super.initState();

    global.readFileSession('counter').then((String value) {
      setState(() {
        counter = int.parse(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Session 2 (Stateful)"),
        ),
        body: Center(
            child: Column(
          children: [
            Text("File session: " + this.counter.toString()),
            FutureBuilder(
                future: global.getSession('counter', 0),
                builder: (context, snapshot) {
                  return Text(snapshot.hasData
                      ? "Shared Pref session: " + snapshot.data.toString()
                      : "loading...");
                }),
            CupertinoButton(
              color: Colors.blue,
              child: Text(
                "Test 1",
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: Session1Screen()));
              },
            ),
          ],
        )));
  }
}
