part of 'movie_list_by_genre_bloc.dart';

abstract class MovieListByGenreEvent extends Equatable{}

class LoadMovieListByGenreEvent extends MovieListByGenreEvent {
 final int page;
 final int genreId;
  LoadMovieListByGenreEvent({
    required this.page,
    required this.genreId,
  });
  
  @override
  List<Object?> get props => [page,genreId];
}
