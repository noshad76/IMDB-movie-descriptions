import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/geners_feature/domain/entities/genres_list_entitie.dart';
import 'package:movie_app/features/geners_feature/domain/repository/genres_repository.dart';

class GetGenreListUsecase {
  GenereRepository genreRepository;
  GetGenreListUsecase(this.genreRepository);

  Future<DataState<GenrelistEntitie>> call() {
    return genreRepository.fetchGenreList();
  }
}
