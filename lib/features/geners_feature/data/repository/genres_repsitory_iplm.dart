
import 'package:dio/dio.dart';

import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/geners_feature/data/data_source/remote/genres_api.dart';
import 'package:movie_app/features/geners_feature/data/model/genres_list.dart';
import 'package:movie_app/features/geners_feature/data/model/movie_list_by_genres.dart';
import 'package:movie_app/features/geners_feature/domain/entities/genres_list_entitie.dart';
import 'package:movie_app/features/geners_feature/domain/entities/movie_list_by_genres.dart';
import 'package:movie_app/features/geners_feature/domain/repository/genres_repository.dart';

class GenereRepositoryImpl extends GenereRepository {
  GenrsApi genersApi;
  GenereRepositoryImpl({
    required this.genersApi,
  });
  @override
  Future<DataState<List<GenrelistEntitie>>> fetchGenreList() async {
    Response response;
    try {
      response = await genersApi.callGenrsList();

      if (response.statusCode == 200) {
        List<GenrelistEntitie> generelistEntitie =
            GenresListModel.fromJson(response.data);
        return DataSuccess(generelistEntitie);
      } else {
        return DataFailed(response.data['errors']);
      }
    } on DioException catch (e) {
      return DataFailed(e.response!.data['errors']);
    }
  }

  @override
  Future<DataState<MovieListByGenreEntitie>> fetchMovieListByGenre(
      int page, int genreId) async {
    Response response;
    try {
      response = await genersApi.callMovieListByGenre(page, genreId);
      if (response.statusCode == 200) {
        MovieListByGenreEntitie movieListByGenereEntitie =
            MovieListByGenereModel.fromJson(response.data);
        return DataSuccess(movieListByGenereEntitie);
      } else {
        return DataFailed(response.data['erorrs']);
      }
    } on DioException catch (e) {
      return DataFailed(e.response!.data['errors']);
    }
  }
}
