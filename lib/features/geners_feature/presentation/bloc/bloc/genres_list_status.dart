import 'package:equatable/equatable.dart';
import 'package:movie_app/features/geners_feature/domain/entities/genres_list_entitie.dart';

abstract class GenreListStatus extends Equatable {}

class GenereListLoding extends GenreListStatus {
  @override
  List<Object?> get props => [];
}

class GenreListCompleted extends GenreListStatus {
  final GenrelistEntitie genrelistEntitie;
  GenreListCompleted(this.genrelistEntitie);
  @override
  List<Object?> get props => [genrelistEntitie];
}

class GenreListError extends GenreListStatus {
  final String message;
  GenreListError(this.message);

  @override
  List<Object?> get props => [message];
}
