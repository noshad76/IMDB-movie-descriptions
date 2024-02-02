// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';


class AuthenticationApi {
 final Dio dio;
  AuthenticationApi({
    required this.dio,
  });
  Future<Response> signUpRequest(
      {required String email, required String password, required String name}) {
    Future<Response> response = dio.post('https://moviesapi.ir/api/v1/register',
        data: {"name": name, "email": email, "password": password});
    return response;
  }

  Future<Response> signinRequest(
      {required String email, required String password}) {
    Future<Response> response = dio.post(
      'https://moviesapi.ir/api/v1/register',
      data: {"grant_type": "password", "email": email, "password": password},
    );
    return response;
  }

  Future<Response> refreshTokenRequest({required String refreshToken}) {
    Future<Response> response = dio.post(
      'https://moviesapi.ir/api/v1/register',
      data: {
        "grant_type": "refresh_token",
        "refresh_token": refreshToken,
      },
    );
    return response;
  }
}
