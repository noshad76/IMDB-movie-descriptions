part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  final MovieListEntity? movieListEntity;
  final String? error;
  const MovieListState({
    this.movieListEntity,
    this.error,
  });

  @override
  List<Object?> get props => [movieListEntity, error];
}

class MovieListLoading extends MovieListState {
const  MovieListLoading();
}
class MovieListLoaded extends MovieListState {
   const MovieListLoaded( MovieListEntity entity):super(movieListEntity: entity);
}
class MovieListFaild extends MovieListState {
const  MovieListFaild(String error):super(error: error);
}
