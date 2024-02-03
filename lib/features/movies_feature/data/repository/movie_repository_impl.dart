// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/movies_feature/data/data_source/remote/movie_api.dart';
import 'package:movie_app/features/movies_feature/data/model/movie_list_model.dart';
import 'package:movie_app/features/movies_feature/data/model/movie_model.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_list_entity.dart';
import 'package:movie_app/features/movies_feature/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieApi movieApi;
  MovieRepositoryImpl({
    required this.movieApi,
  });
  @override
  Future<DataState<MovieEntity>> fetchMovieData(int id) async {
    Response response;
    try {
      response = await movieApi.callMovieDetails(id);
      if (response.statusCode == 200) {
        MovieEntity movieEntity = MovieModel.fromJson(response.data);
        return DataSuccess(movieEntity);
      } else {
        return  DataFailed(response.data['errors']);
      }
    }on DioException catch (e) {
      return  DataFailed(e.response!.data['errors']);
    }
  }

  @override
  Future<DataState<MovieListEntity>> fetchMovieListData(int page) async {
     Response response;
    try {
      response = await movieApi.callMovieList(page);
      if (response.statusCode == 200) {
        MovieListEntity movieListEntity = MovieListModel.fromJson(response.data);
        return DataSuccess(movieListEntity);
      } else {
        return  DataFailed(response.data['errors']);
      }
    }on DioException catch (e) {
      return  DataFailed(e.response!.data['errors']);
    }
  }
}
