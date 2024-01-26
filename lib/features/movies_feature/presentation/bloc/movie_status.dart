import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_entity.dart';

abstract class MovieStatus extends Equatable {}

class Movieloading extends MovieStatus {
  @override
  List<Object?> get props => [];
}

class MovieCompleted extends MovieStatus {
  final MovieEntity movieEntity;
  MovieCompleted(this.movieEntity);

  @override
  List<Object?> get props => [movieEntity];
}

class MovieError extends MovieStatus {
  final String message;
  MovieError(this.message);

  @override
  List<Object?> get props => [message];
}
