import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_flutter/business_logic/constante.dart';
import 'package:manga_flutter/model/manga.dart';
import 'package:manga_flutter/provider/mangas_provider.dart';
import 'package:manga_flutter/repository/mangas_repository.dart';
import 'package:manga_flutter/screen/info_manga.dart';

class HomeWidget extends ConsumerStatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeWidget> createState() => HomeWidgetState();
}

class HomeWidgetState extends ConsumerState<HomeWidget> {
  int page = 1;
  List<Mangas> mangasListSearch = [];
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ref.watch(
      mangasListProvider(page),
    );
    List<Mangas> mangasList = ref.watch(mangasProvider);
    ListSearch mode = ref.watch(listSearchProviderState);

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Rechercher un manga...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: mode == ListSearch.SEARCH
                  ? IconButton(
                      onPressed: () {
                        controller.clear();
                        ref
                            .watch(listSearchProviderState.notifier)
                            .update((state) => ListSearch.LIST);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        size: 20,
                      ),
                    )
                  : null,
            ),
            onChanged: (value) async {
              if (value.isEmpty) {
                ref
                    .watch(listSearchProviderState.notifier)
                    .update((state) => ListSearch.LIST);
              } else {
                ref
                    .watch(listSearchProviderState.notifier)
                    .update((state) => ListSearch.SEARCH);
              }
              final MangasRepository mangasRepo = MangasRepository();
              List<Mangas> mangas = await mangasRepo.searchMangas(value);
              setState(() {
                mangasListSearch = mangas;
              });
            },
          ),
          Expanded(
              child: mode == ListSearch.LIST
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      InfoMangaWidget(manga: mangasList[index]),
                                ),
                              );
                            },
                            leading: Image.network(mangasList[index]
                                .data
                                .images['jpg']['small_image_url']),
                            title: Text(mangasList[index].data.title),
                            trailing: IconButton(
                                onPressed: () {
                                  ref
                                      .watch(mangaProvider.notifier)
                                      .add(mangasList[index]);
                                },
                                icon: const Icon(Icons.bookmark_add)),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: mangasList.length)
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => InfoMangaWidget(
                                    manga: mangasListSearch[index]),
                              ),
                            );
                          },
                          leading: Image.network(mangasListSearch[index]
                              .data
                              .images['jpg']['small_image_url']),
                          title: Text(mangasListSearch[index].data.title),
                          trailing: IconButton(
                              onPressed: () {
                                ref
                                    .watch(mangaProvider.notifier)
                                    .add(mangasListSearch[index]);
                              },
                              icon: const Icon(Icons.bookmark_add)),
                        ));
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: mangasListSearch.length)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: colorButton,
          child: const Icon(
            Icons.arrow_drop_down,
            size: 50,
          ),
          onPressed: () {
            page++;
            ref.watch(mangasListProvider(page));
            setState(() {});
          }),
    );
  }
}
