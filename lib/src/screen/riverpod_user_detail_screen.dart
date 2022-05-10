import 'package:flutter/material.dart';

import 'package:flutter_kitchensink/src/model/user_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.e}) : super(key: key);
  final UserModel e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 60,
                backgroundImage: NetworkImage(e.avatar),
              ),
            ),
            Text(
              e.firstname + " " + e.lastname,
            ),
            Text(e.email),
          ],
        ),
      ),
    );
  }
}
