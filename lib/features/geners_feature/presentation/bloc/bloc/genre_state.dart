part of 'genre_bloc.dart';

class GenreState extends Equatable {
  final GenreListStatus genreListStatus;
  final MovieListByGenreStatus movieListByGenreStatus;

  const GenreState(
      {required this.genreListStatus, required this.movieListByGenreStatus});

  GenreState copyWith(
      {GenreListStatus? newGenreListStatus,
      MovieListByGenreStatus? newMovieListByGenreStatus}) {
    return GenreState(
        genreListStatus: newGenreListStatus ?? genreListStatus,
        movieListByGenreStatus:
            newMovieListByGenreStatus ?? movieListByGenreStatus);
  }

  @override
  List<Object?> get props => [genreListStatus, movieListByGenreStatus];
}
