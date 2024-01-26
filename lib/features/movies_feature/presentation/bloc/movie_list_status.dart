import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_list_entity.dart';

abstract class MovieListStatus extends Equatable {}

class MovieListloading extends MovieListStatus {
  @override
  List<Object?> get props => [];
}

class MovieListCompleted extends MovieListStatus {
  final MovieListEntity movieListEntity;
  MovieListCompleted(this.movieListEntity);

  @override
  List<Object?> get props => [movieListEntity];
}

class MovieListError extends MovieListStatus {
  final String message;
  MovieListError(this.message);

  @override
  List<Object?> get props => [message];
}
