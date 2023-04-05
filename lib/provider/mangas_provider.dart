// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manga_flutter/model/manga.dart';
import 'package:manga_flutter/repository/mangas_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final mangasProvider =
    StateNotifierProvider<MangasProvider, List<Mangas>>((ref) {
  return MangasProvider();
});

class MangasProvider extends StateNotifier<List<Mangas>> {
  MangasProvider() : super([]);

  void add(Mangas mangasList) {
    state = [...state, mangasList];
  }
}

final mangasListProvider =
    FutureProvider.family<bool, int>((ref, pagination) async {
  MangasRepository mangas = MangasRepository();
  List<Mangas> listMangas = await mangas.fetchMangas(pagination);
  for (int i = 0; i < listMangas.length; i++) {
    ref.watch(mangasProvider.notifier).add(listMangas[i]);
  }
  return true;
});

enum ListMode { LIST, SEARCH }

final listModeProviderState = StateProvider<ListMode>((_) => ListMode.LIST);

final listModePorvider = Provider<ListMode>((ref) {
  final ListMode sortType = ref.watch(listModeProviderState);

  switch (sortType) {
    case ListMode.LIST:
      return ListMode.LIST;

    case ListMode.SEARCH:
      return ListMode.SEARCH;
  }
});

final mangaProvider =
    StateNotifierProvider<MangaFavorisNotifier, List<Mangas>>((ref) {
  return MangaFavorisNotifier();
});

class MangaFavorisNotifier extends StateNotifier<List<Mangas>> {
  MangaFavorisNotifier() : super([]);

  //passer les preference en tant que liste initial

  void add(Mangas manga) {
    saveMangas(manga);
    state = [...state, manga];
  }

  // void addListAdr(List<Mangas> mangas) {
  //   state = mangas;
  // }

  void remove(Mangas manga, int index) {
    deleteAdr(index);
    state = [
      for (final mg in state)
        if (mg.data.mal_id != manga.data.mal_id) mg,
    ];
  }

  // void getLignes() async {
  //   List<Mangas> mangasList = await getMangas();
  //   state = mangasList;
  // }
}

List<String> listJson = [];

getMangas() async {
  List<Mangas> lignesList = [];
  Map<String, dynamic> decode = {};
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  listJson = prefs.getStringList("mangas")!.toList();
  if (listJson.isNotEmpty) {
    for (int i = 0; i < listJson.length; i++) {
      decode = jsonDecode(listJson[i]);
      // lignesList.add(Mangas.fromtest(decode));
    }
  }
  return lignesList;
}

Future<void> saveMangas(Mangas mangas) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("mangas") == null) {
    listJson.add(jsonEncode(mangas.toMap()));
  } else {
    listJson = prefs.getStringList("mangas")!;
    listJson.add(jsonEncode(mangas.toMap()));
  }
  prefs.setStringList('mangas', listJson);
}

Future<void> deleteAdr(int lignesIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  listJson = prefs.getStringList('mangas')!;
  listJson.removeAt(lignesIndex);
  prefs.setStringList('mangas', listJson);
}
