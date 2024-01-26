import 'package:dio/dio.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/movies_feature/data/data_source/remote/movie_api.dart';
import 'package:movie_app/features/movies_feature/data/model/movie_list_model.dart';
import 'package:movie_app/features/movies_feature/data/model/movie_model.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_list_entity.dart';
import 'package:movie_app/features/movies_feature/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieApi movieApi = MovieApi();
  @override
  Future<DataState<MovieEntity>> fetchMovieData(int id) async {
    try {
      Response response = await movieApi.callMovieDetails(id);
      if (response.statusCode == 200) {
        MovieEntity movieEntity = MovieModel.fromJson(response.data);
        return DataSuccess(movieEntity);
      } else {
        return const DataFailed('Something Went Wrong. try again...');
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }

  @override
  Future<DataState<MovieListEntity>> fetchMovieListData(int page) async {
     try {
      Response response = await movieApi.callMovieList(page);
      if (response.statusCode == 200) {
        MovieListEntity movieListEntity = MovieListModel.fromJson(response.data);
        return DataSuccess(movieListEntity);
      } else {
        return const DataFailed('Something Went Wrong. try again...');
      }
    } catch (e) {
      return const DataFailed("please check your connection...");
    }
  }
}
