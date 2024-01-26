import 'package:dio/dio.dart';

class GenrsApi {
  Dio dio = Dio();
  Future<Response> callGenrsList() async {
    Response response = await dio.get('https://moviesapi.ir/api/v1/genres');
    return response;
  }
   Future<Response> callMovieListByGenre(int page,int genreId) async {
    Response response = await dio.get('https://moviesapi.ir/api/v1/genres/$genreId/movies',queryParameters: {'page':page});
    return response;
  }
}

