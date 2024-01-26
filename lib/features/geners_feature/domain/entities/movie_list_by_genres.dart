import 'package:equatable/equatable.dart';
import 'package:movie_app/features/geners_feature/data/model/movie_list_by_genres.dart';

class MovieListByGenreEntitie extends Equatable {
  final List<Data> data;
  final Metadata metadata;
  const MovieListByGenreEntitie({
    required this.data,
    required this.metadata,
  });

  @override
  List<Object> get props => [data, metadata];
}