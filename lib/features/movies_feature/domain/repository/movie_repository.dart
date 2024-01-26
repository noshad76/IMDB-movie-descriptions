import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_list_entity.dart';

abstract class MovieRepository {
  Future<DataState<MovieListEntity>> fetchMovieListData(int page);
  Future<DataState<MovieEntity>> fetchMovieData(int id);
}
