import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/core/usecases/usecases.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies_feature/domain/repository/movie_repository.dart';

class GetMovieDetailsUsecase extends UseCase<DataState<MovieEntity>, int> {
  MovieRepository movieRepository;
  GetMovieDetailsUsecase(this.movieRepository);
  @override
  Future<DataState<MovieEntity>> call(int param) {
    return movieRepository.fetchMovieData(param);
  }
}
