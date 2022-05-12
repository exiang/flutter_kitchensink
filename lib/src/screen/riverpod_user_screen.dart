import 'package:flutter/material.dart';
import 'package:flutter_kitchensink/src/model/user_model.dart';
import 'package:flutter_kitchensink/src/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_kitchensink/src/provider/data_provider.dart';
import 'package:flutter_kitchensink/src/screen/riverpod_user_popup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodUserScreen extends StatefulHookConsumerWidget {
  const RiverpodUserScreen({Key? key}) : super(key: key);

  @override
  RiverpodUserScreenState createState() => RiverpodUserScreenState();
}

class RiverpodUserScreenState extends ConsumerState<RiverpodUserScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(userDataProvider.notifier).loadData(ref);
  }

  @override
  Widget build(BuildContext context) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: Column(
          children: [
            ..._data.data.map((e) => ListView(shrinkWrap: true, children: [
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
                      title: Text(e.firstname + ' ' + e.lastname),
                      subtitle: Text(e.email),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(e.avatar),
                      ),
                    ),
                  ),
                ])),
          ],
        ));
  }
}
