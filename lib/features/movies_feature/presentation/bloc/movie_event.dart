part of 'movie_bloc.dart';

abstract class MovieEvent {}

class LoadMovie extends MovieEvent {
  int id;
  LoadMovie(this.id);
}

class LoadListMovie extends MovieEvent {
  int page;
  LoadListMovie(this.page);
}
