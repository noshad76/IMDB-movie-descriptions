import 'package:dio/dio.dart';

class MovieApi {
  Dio dio = Dio();
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
