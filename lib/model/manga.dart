// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class Mangas {
  final Map<String, dynamic> pagination;
  final InfoMangas data;

  Mangas({
    required this.pagination,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pagination': pagination,
      'dataManga': data,
    };
  }

  factory Mangas.fromMap(
      Map<String, dynamic> paginations, InfoMangas infoMangas) {
    return Mangas(
      pagination: paginations,
      data: infoMangas,
    );
  }
}

class InfoMangas {
  final int mal_id;
  final String url;
  final Map<String, dynamic> images;
  final bool approved;
  final List<dynamic> titles;
  final String title;
  final String title_english;
  final String title_japanese;
  final List title_synonyms;
  final String type;
  final int chapters;
  final int volumes;
  final String status;
  final bool publishing;
  final Map<String, dynamic> published;
  final num score;
  final num scored;
  final num scored_by;
  final num rank;
  final num popularity;
  final num members;
  final num favorites;
  final String synopsis;
  final String background;
  final List<dynamic> authors;
  final List<dynamic> serializations;
  final List<dynamic> genres;
  final List explicit_genres;
  final List<dynamic> themes;
  final List<dynamic> demographics;

  InfoMangas({
    required this.mal_id,
    required this.url,
    required this.images,
    required this.approved,
    required this.titles,
    required this.title,
    required this.title_english,
    required this.title_japanese,
    required this.title_synonyms,
    required this.type,
    required this.chapters,
    required this.volumes,
    required this.status,
    required this.publishing,
    required this.published,
    required this.score,
    required this.scored,
    required this.scored_by,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.authors,
    required this.serializations,
    required this.genres,
    required this.explicit_genres,
    required this.themes,
    required this.demographics,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mal_id': mal_id,
      'url': url,
      'images': images,
      'approved': approved,
      'titles': titles,
      'title': title,
      'title_english': title_english,
      'title_japanese': title_japanese,
      'title_synonyms': title_synonyms,
      'type': type,
      'chapters': chapters,
      'volumes': volumes,
      'status': status,
      'publishing': publishing,
      'published': published,
      'score': score,
      'scored': scored,
      'scored_by': scored_by,
      'rank': rank,
      'popularity': popularity,
      'members': members,
      'favorites': favorites,
      'synopsis': synopsis,
      'background': background,
      'authors': authors,
      'serializations': serializations,
      'genres': genres,
      'explicit_genres': explicit_genres,
      'themes': themes,
      'demographics': demographics,
    };
  }

  factory InfoMangas.fromMap(Map<String, dynamic> map) {
    return InfoMangas(
      mal_id: map['mal_id'] as int,
      url: map['url'] ?? "",
      images: map['images'],
      approved: map['approved'] as bool,
      titles: map['titles'],
      title: map['title'] ?? "",
      title_english: map['title_english'] ?? "",
      title_japanese: map['title_japanese'] ?? "",
      title_synonyms: map['title_synonyms'],
      type: map['type'] as String,
      chapters: map['chapters'] ?? 0,
      volumes: map['volumes'] ?? 0,
      status: map['status'] ?? "",
      publishing: map['publishing'] as bool,
      published: map['published'],
      score: map['score'] ?? 0,
      scored: map['scored'] ?? 0,
      scored_by: map['scored_by'] ?? 0,
      rank: map['rank'] ?? 0,
      popularity: map['popularity'] ?? 0,
      members: map['members'] ?? 0,
      favorites: map['favorites'] ?? 0,
      synopsis: map['synopsis'] ?? "",
      background: map['background'] ?? "",
      authors: map['authors'],
      serializations: map['serializations'],
      genres: map['genres'],
      explicit_genres: map['explicit_genres'],
      themes: map['themes'],
      demographics: map['demographics'],
    );
  }
}
