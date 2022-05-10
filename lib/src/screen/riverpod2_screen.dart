import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_kitchensink/src/misc/global.dart' as global;

class Riverpod2Screen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod2'),
      ),
      body: Container(
        child: Center(
          child: Text(ref.watch(global.kCounterProvider).toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(global.kCounterProvider.notifier).state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
