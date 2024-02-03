// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_list_by_genre_bloc.dart';

abstract class MovieListByGenreState extends Equatable {
  final MovieListByGenreEntitie? movieListByGenreEntitie;
  final String? error;
  const MovieListByGenreState({
    this.movieListByGenreEntitie,
    this.error,
  });

  @override
  List<Object?> get props => [movieListByGenreEntitie, error];
}

class MovieListByGenreLoading extends MovieListByGenreState {
  const MovieListByGenreLoading();
}

class MovieListByGenreLoaded extends MovieListByGenreState {
  const MovieListByGenreLoaded(MovieListByGenreEntitie movieListByGenreEntitie)
      : super(movieListByGenreEntitie: movieListByGenreEntitie);
}

class MovieListByGenreFaild extends MovieListByGenreState {
  const MovieListByGenreFaild(String error) : super(error: error);
}
