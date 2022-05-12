import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_kitchensink/src/provider/data_provider.dart';
import 'package:flutter_kitchensink/src/model/user_model.dart';

class RiverpodUserPopup extends ConsumerWidget {
  const RiverpodUserPopup({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    // demo how _data still accessible in another widget
    UserModel selected = _data.data.firstWhere((user) => user.id == id);
    return Container(
      height: 250,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
                radius: 60,
                child: ClipOval(
                  child: Image.network(
                    selected.avatar,
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ),
                )),
            Text(
              selected.firstname + ' ' + selected.lastname,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Change Name'),
              onPressed: () {
                // todo: alter the provider data and show reactive changes
                // it seems the original FutureProvider do not allow modification  https://riverpod.dev/docs/providers/future_provider/
                // the working tutorial seems to be here at https://dev.to/elianmortega/how-to-start-using-riverpod-statenotifier-and-freezed-in-your-flutter-applications-181k
                ref
                    .read(userDataProvider.notifier)
                    .edit(id: selected.id, firstname: 'hello');
              },
            ),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
