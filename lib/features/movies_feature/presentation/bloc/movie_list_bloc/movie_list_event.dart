part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {}

class LoadListMovie extends MovieListEvent {
  final int page;
  LoadListMovie(this.page);

  @override
  List<Object?> get props => [page];
}
