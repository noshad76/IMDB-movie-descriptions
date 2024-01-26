import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/geners_feature/domain/entities/genres_list_entitie.dart';
import 'package:movie_app/features/geners_feature/domain/entities/movie_list_by_genres.dart';

abstract class GenereRepository {
  Future<DataState<GenrelistEntitie>> fetchGenreList();
  Future<DataState<MovieListByGenreEntitie>> fetchMovieListByGenre(
      int page, int genreId);
}
