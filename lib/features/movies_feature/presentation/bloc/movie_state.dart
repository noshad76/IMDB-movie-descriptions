part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final MovieStatus movieStatus;
  final MovieListStatus movieListStatus;
  const MovieState({required this.movieStatus, required this.movieListStatus});
  MovieState copyWith(
      {MovieStatus? newMovieStatus, MovieListStatus? newMovieListStatus}) {
    return MovieState(
        movieStatus: newMovieStatus ?? movieStatus,
        movieListStatus: newMovieListStatus ?? movieListStatus);
  }

  @override
  List<Object> get props => [movieStatus, movieListStatus];
}
