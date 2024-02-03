import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecases/usecases.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_list_entity.dart';
import 'package:movie_app/features/movies_feature/domain/repository/movie_repository.dart';

class GetMovieListUsecase extends UseCase<DataState<MovieListEntity>, int> {
  MovieRepository movieRepository;
  GetMovieListUsecase(this.movieRepository);
  @override
  Future<DataState<MovieListEntity>> call(int param) {
    return movieRepository.fetchMovieListData(param);
  }
}
