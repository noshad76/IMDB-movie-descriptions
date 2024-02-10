import 'package:dio/dio.dart' as dio;
import 'package:mockito/annotations.dart';
import 'package:movie_app/features/authentication_feature/domain/repository/authentication_repository.dart';

@GenerateMocks([AuthenticationRepository], customMocks:[ MockSpec<dio.HttpClientAdapter>(as: #MockHttpClient)])
void main() {}
