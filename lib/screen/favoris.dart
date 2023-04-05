import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_flutter/provider/mangas_provider.dart';
import 'package:manga_flutter/screen/info_manga.dart';

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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InfoMangaWidget(manga: list[index]),
                ),
              );
            },
            leading: Image.network(
                list[index].data.images['jpg']['small_image_url']),
            title: Text(list[index].data.title),
            trailing: IconButton(
              onPressed: () {
                ref.read(mangaProvider.notifier).delete(list[index], index);
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
