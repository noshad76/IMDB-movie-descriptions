import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/geners_feature/domain/entities/movie_list_by_genres.dart';
import 'package:movie_app/features/geners_feature/domain/repository/genres_repository.dart';

class GetMovieListByGenretUsecase {
  GenereRepository genreRepository;
  GetMovieListByGenretUsecase(this.genreRepository);

  Future<DataState<MovieListByGenreEntitie>> call(int page, int genreId) {
    return genreRepository.fetchMovieListByGenre(page, genreId);
  }
}
