import 'package:movie_app/features/movies_feature/domain/entities/movie_list_entity.dart';

class MovieListModel extends MovieListEntity {
  const MovieListModel({List<Data>? data, Metadata? metadata})
      : super(data: data, metadata: metadata);

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    var data = <Data>[];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }

    Metadata? metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    return MovieListModel(data: data, metadata: metadata);
  }
}

class Data {
  Data({
    int? id,
    String? title,
    String? poster,
    String? year,
    String? country,
    String? imdbRating,
    List<String>? genres,
    List<String>? images,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      poster: json['poster'],
      year: json['year'],
      country: json['country'],
      imdbRating: json['imdb_rating'],
      genres: json['genres'].cast<String>(),
      images: json['images'].cast<String>(),
    );
  }
}

class Metadata {
  String? currentPage;
  int? perPage;
  int? pageCount;
  int? totalCount;

  Metadata({this.currentPage, this.perPage, this.pageCount, this.totalCount});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    perPage = json['per_page'];
    pageCount = json['page_count'];
    totalCount = json['total_count'];
  }
}
