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
    UserModel selected = _data.value!.firstWhere((user) => user.id == id);
    return BottomSheet(
      backgroundColor: Colors.blueGrey.shade900.withAlpha(240),
      builder: (BuildContext context) {
        // demo how _data still accessible in another widget
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
                  child: const Text('Close'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
      onClosing: () {},
    );
  }
}
