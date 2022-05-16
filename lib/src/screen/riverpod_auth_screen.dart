import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_kitchensink/src/provider/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_kitchensink/src/misc/global.dart' as global;

class RiverpodAuthScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authProvider = ref.watch(authDataProvider);
    final _authNotifier = ref.watch(authDataProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Riverpod Auth'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Click button below to set global auth state using riverpod',
            ),
            ElevatedButton(
                child: const Text('Change Nickname'),
                onPressed: () => _authNotifier
                    .setNickname('Abu ' + Random().nextInt(9999).toString())),
            SizedBox(height: 30),
            Text(
              'Nickname: ' + _authProvider.nickname,
            ),
          ],
        ),
      ),
    );
  }
}
