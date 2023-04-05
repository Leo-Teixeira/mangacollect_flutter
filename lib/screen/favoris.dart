import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:manga_flutter/provider/mangas_provider.dart';

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
  final list = ref.watch(mangaProvider);
  return Center(
    child: ListView.separated(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Image.network(
                list[index].data.images['jpg']['small_image_url']),
            title: Text(list[index].data.title),
            trailing: IconButton(
              onPressed: () {
                ref.read(mangaProvider.notifier).remove(list[index], index);
              },
              icon: const Icon(
                Icons.delete,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 8);
      },
    ),
  );
}
