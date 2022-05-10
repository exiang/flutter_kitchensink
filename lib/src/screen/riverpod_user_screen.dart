import 'package:flutter/material.dart';
import 'package:flutter_kitchensink/src/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_kitchensink/src/provider/data_provider.dart';
import 'package:flutter_kitchensink/src/screen/riverpod_user_popup.dart';

class RiverpodUserScreen extends ConsumerWidget {
  const RiverpodUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: _data.when(
          data: (_data) {
            return Column(
              children: [
                ..._data.map((e) => ListView(shrinkWrap: true, children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.white.withOpacity(0),
                            backgroundColor:
                                Colors.blueGrey.shade900.withAlpha(240),
                            context: context,
                            builder: (BuildContext context) {
                              // demo how _data still accessible in another widget
                              UserModel selected =
                                  _data.firstWhere((user) => user.id == e.id);
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
                                        selected.firstname +
                                            ' ' +
                                            selected.lastname,
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
                          );
                        },
                        child: ListTile(
                          title: Text(e.firstname),
                          subtitle: Text(e.lastname),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(e.avatar),
                          ),
                        ),
                      ),
                    ])),
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
