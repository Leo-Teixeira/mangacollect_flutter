import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class FavorisWidget extends ConsumerWidget {
  const FavorisWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: body(ref),
    );
  }
}

Widget body(WidgetRef ref) {
  // final list = ref.watch(LocationProvider);
  return Center(
    child: ListView.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            // addPos(list[index].lat ?? 0.0, list[index].long ?? 0.0);
            // ref.refresh(meteoProvider);
            // ref.watch(MapProvider.notifier).saveAddPoint(
            //     LatLng(list[index].lat ?? 0.0, list[index].long ?? 0.0));
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => const BottomAppBarWidgetState()));
          },
          // leading: const Icon(Icons.apartment),
          title: Text("test"),
          subtitle: Text("testtest"),
          trailing: IconButton(
            onPressed: () {
              // ref.read(LocationProvider.notifier).remove(list[index], index);
            },
            icon: const Icon(
              Icons.bookmark,
              color: Colors.yellow,
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 0);
      },
    ),
  );
}
