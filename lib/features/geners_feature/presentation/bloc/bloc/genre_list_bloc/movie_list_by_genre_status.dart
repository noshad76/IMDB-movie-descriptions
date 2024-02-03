import 'package:equatable/equatable.dart';
import 'package:movie_app/features/geners_feature/domain/entities/movie_list_by_genres.dart';

abstract class MovieListByGenreStatus extends Equatable {}

class MovieListByGenreLoding extends MovieListByGenreStatus {
  @override
  List<Object?> get props => [];
}

class MovieListByGenreCompleted extends MovieListByGenreStatus {
  final MovieListByGenreEntitie movieListByGenreEntitie;
  MovieListByGenreCompleted(this.movieListByGenreEntitie);
  @override
  List<Object?> get props => [movieListByGenreEntitie];
}

class MovieListByGenreError extends MovieListByGenreStatus {
  final String message;
  MovieListByGenreError(this.message);

  @override
  List<Object?> get props => [message];
}
