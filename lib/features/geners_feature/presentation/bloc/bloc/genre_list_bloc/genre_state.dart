// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'genre_bloc.dart';

abstract class GenreListState extends Equatable {
  final List<GenrelistEntitie>? genrelistEntitie;
  final String? error;
  const GenreListState({
    this.genrelistEntitie,
    this.error,
  });
  @override
  List<Object?> get props => [genrelistEntitie, error];
}

class GenreListLoading extends GenreListState {
  const GenreListLoading();
}

class GenreListLoaded extends GenreListState {
  const GenreListLoaded(List<GenrelistEntitie> genrelistEntitie)
      : super(genrelistEntitie: genrelistEntitie);
}

class GenreListFaild extends GenreListState {
  const GenreListFaild(String error) : super(error: error);
}
