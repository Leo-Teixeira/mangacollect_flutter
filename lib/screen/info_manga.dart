import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_flutter/business_logic/constante.dart';
import 'package:manga_flutter/model/manga.dart';

class InfoMangaWidget extends ConsumerWidget {
  final Mangas manga;
  const InfoMangaWidget({super.key, required this.manga});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAppBar,
        title: const Text("Retour"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(manga.data.images['jpg']['image_url'])),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                manga.data.title,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Author : ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  for (int i = 0; i < manga.data.authors.length; i++)
                    Text(manga.data.authors[i]['name']),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Synopsis : ",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(manga.data.synopsis),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Status : ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              manga.data.status,
              style: TextStyle(
                  color: manga.data.status == "Finished"
                      ? Colors.green
                      : Colors.red),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Published : ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              manga.data.published['string'],
            )
          ],
        ),
      ),
    );
  }
}
