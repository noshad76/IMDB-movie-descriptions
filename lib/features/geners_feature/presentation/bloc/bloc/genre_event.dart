part of 'genre_bloc.dart';

abstract class GenreEvent {}

class LoadGenreList extends GenreEvent {}

class LoadMovieListByGenere extends GenreEvent {
  int page;
  int genereId;
  LoadMovieListByGenere(this.page, this.genereId);
}
