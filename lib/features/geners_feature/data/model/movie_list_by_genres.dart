// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:movie_app/features/geners_feature/domain/entities/movie_list_by_genres.dart';

class MovieListByGenereModel extends MovieListByGenreEntitie {
  
  const MovieListByGenereModel({
    required List<Data>  data,
   required Metadata metadata,
  }) : super(data: data, metadata: metadata);

  factory MovieListByGenereModel.fromMap(Map<String, dynamic> map) {
    return MovieListByGenereModel(
      data: List<Data>.from(
        (map['data'] as List<int>).map<Data>(
          (x) => Data.fromMap(x as Map<String, dynamic>),
        ),
      ),
      metadata: Metadata.fromMap(map['metadata'] as Map<String, dynamic>),
    );
  }

  factory MovieListByGenereModel.fromJson(String source) =>
      MovieListByGenereModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  
}

class Data extends Equatable {
  final int id;
  final String title;
  final String poster;
  final String year;
  final String country;
  final String imdb_rating;
  final List<String> genres;
  final List<String> images;
  const Data({
    required this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.country,
    required this.imdb_rating,
    required this.genres,
    required this.images,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      poster: map['poster'] as String,
      year: map['year'] as String,
      country: map['country'] as String,
      imdb_rating: map['imdb_rating'] as String,
      genres: List<String>.from((map['genres'] as List<String>)),
      images: List<String>.from((map['images'] as List<String>)),
    );
  }

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props {
    return [
      id,
      title,
      poster,
      year,
      country,
      imdb_rating,
      genres,
      images,
    ];
  }
}

class Metadata extends Equatable {
  final String current_page;
  final int per_page;
  final int page_count;
  final int total_count;
  const Metadata({
    required this.current_page,
    required this.per_page,
    required this.page_count,
    required this.total_count,
  });

  factory Metadata.fromMap(Map<String, dynamic> map) {
    return Metadata(
      current_page: map['current_page'] as String,
      per_page: map['per_page'].toInt() as int,
      page_count: map['page_count'].toInt() as int,
      total_count: map['total_count'].toInt() as int,
    );
  }

  factory Metadata.fromJson(String source) =>
      Metadata.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [current_page, per_page, page_count, total_count];
}
