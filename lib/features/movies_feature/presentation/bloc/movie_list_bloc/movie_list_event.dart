part of 'movie_list_bloc.dart';

abstract class MovieListEvent {}

class LoadListMovie extends MovieListEvent {
  int page;
  LoadListMovie(this.page);
}
