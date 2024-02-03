// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class MovieApi {
  Dio dio;
  MovieApi({
    required this.dio,
  });
  Future<Response> callMovieList(int page) async {
    Response movieListResponse =
        await dio.get('https://moviesapi.ir/api/v1/movies', queryParameters: {
      'page': page,
    });
    return movieListResponse;
  }

  Future<Response> callMovieDetails(int id) async {
    Response movieListResponse = await dio
        .get('https://moviesapi.ir/api/v1/movies/{movie_id}', queryParameters: {
      'movie_id': id,
    });
    return movieListResponse;
  }
}
