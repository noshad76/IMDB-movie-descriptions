// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class AuthenticationApi {
  signUpRequest(
      {required String name, required String email, required String password});
}

class AuthenticationApiImpl extends AuthenticationApi {
  final Dio dio;
  AuthenticationApiImpl({
    required this.dio,
  });
  @override
  Future<Response> signUpRequest(
      {required String email, required String password, required String name}) {
    Future<Response> response = dio.post('https://moviesapi.ir/api/v1/register',
        data: {"name": name, "email": email, "password": password});
    return response;
  }
}
