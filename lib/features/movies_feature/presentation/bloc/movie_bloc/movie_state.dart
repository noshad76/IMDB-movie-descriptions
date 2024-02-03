part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  final MovieEntity? movieEntity;
  final String? error;
  const MovieState({
    this.movieEntity,
    this.error,
  });

  @override
  List<Object?> get props => [movieEntity, error];
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieLoaded extends MovieState {
  const MovieLoaded(MovieEntity movieEntity) : super(movieEntity: movieEntity);
}
class MovieFaild extends MovieState {
  const MovieFaild(String error) : super(error: error);
}
