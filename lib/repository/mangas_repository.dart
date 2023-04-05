import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:manga_flutter/model/manga.dart';
import 'package:manga_flutter/provider/mangas_provider.dart';

class MangasRepository {
  Future<List<Mangas>> fetchMangas(int pagination) async {
    List<Mangas> mangasList = [];
    final Response response = await get(
        Uri.parse('https://api.jikan.moe/v4/manga/?page=$pagination'));
    if (response.statusCode == 200) {
      // Transformation du JSON (String) en Map<String, dynamic>
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json.containsKey("data")) {
        Map<String, dynamic> pagination = json['pagination'];
        List<dynamic> data = json['data'];

        for (int i = 0; i < data.length; i++) {
          mangasList
              .add(Mangas.fromMap(pagination, InfoMangas.fromMap(data[i])));
        }

        return mangasList;
      } else {
        throw Exception('Failed to load addresses');
      }
    } else {
      throw Exception('Failed to load ta mere');
    }
  }

  Future<List<Mangas>> searchMangas(String query) async {
    List<Mangas> mangasList = [];
    final Response response =
        await get(Uri.parse('https://api.jikan.moe/v4/manga/?q=$query'));
    if (response.statusCode == 200) {
      // Transformation du JSON (String) en Map<String, dynamic>
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json.containsKey("data")) {
        Map<String, dynamic> pagination = json['pagination'];
        List<dynamic> data = json['data'];

        for (int i = 0; i < data.length; i++) {
          mangasList
              .add(Mangas.fromMap(pagination, InfoMangas.fromMap(data[i])));
        }

        return mangasList;
      } else {
        throw Exception('Failed to load addresses');
      }
    } else {
      throw Exception('Failed to load ta mere');
    }
  }
}
