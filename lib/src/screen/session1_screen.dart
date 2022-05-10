/*
  this will store the data in 2 ways: using file & using SessionManager package which backed by sharedPreferences.

  both need to first load the value to stateful variable for reflective update within the screen itself.

  sharedPreferences is best for small amount of data while file system can handle larger data

  Riverpod can achieve the same effect to keep the variable session between screens, without the need to read write to sharedPreferences/file system on every read/write. Plus, riverpod reflective can be done in child and auto reflect at parent. However, riverpod is not permanent and exists within the app life cycle only.
*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_kitchensink/src/misc/global.dart' as global;
import 'package:flutter_kitchensink/src/screen/session2_screen.dart';

class Session1Screen extends StatefulWidget {
  @override
  _Session1ScreenState createState() => _Session1ScreenState();
}

class _Session1ScreenState extends State<Session1Screen> {
  int counter = 0;
  int sessionCounter = 0;
  bool isLogin = false;
  String loginEmail = '';

  @override
  void initState() {
    super.initState();

    global.readFileSession('counter').then((String value) {
      setState(() {
        counter = int.parse(value);
      });
    });

    global.getSession('counter', 0).then((result) {
      setState(() {
        sessionCounter = result;
      });
    });
  }

  @override
  void setState(fn) {
    print("setState()");
    super.setState(fn);
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies()');
    super.didChangeDependencies();
  }

  void didUpdateWidget(covariant Session1Screen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget()');
  }

  @override
  void deactivate() {
    print('deactivate()');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Session 1 (Stateful)"),
        ),
        body: Center(
            child: Column(
          children: [
            Text("File session: " + counter.toString()),
            CupertinoButton(
              color: Colors.blue,
              child: Text(
                "increase",
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  counter += 1;
                  global.writeFileSession('counter', counter.toString());
                });
              },
            ),
            /*FutureBuilder(
                future: global.getSession('counter', 0),
                builder: (context, snapshot) {
                  return Text(snapshot.hasData
                      ? snapshot.data.toString()
                      : "loading...");
                }),*/
            Text("SharedPref session: " + sessionCounter.toString()),
            CupertinoButton(
              color: Colors.blue,
              child: Text(
                "increase",
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  sessionCounter += 1;
                  global.setSession('counter', sessionCounter.toString());
                });
              },
            ),
            CupertinoButton(
              color: Colors.green,
              child: Text(
                "Test 2",
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: Session2Screen()));
              },
            ),
          ],
        )));
  }
}
