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
                                return RiverpodUserPopup(id: e.id);
                              });
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
