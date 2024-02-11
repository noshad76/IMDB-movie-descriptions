import 'package:dio/dio.dart' as dio;
import 'package:mockito/annotations.dart';
import 'package:movie_app/features/authentication_feature/data/data_source/remote/authentication_api.dart';
import 'package:movie_app/features/authentication_feature/domain/repository/authentication_repository.dart';
import 'package:movie_app/features/authentication_feature/domain/usecases/get_userdata_usecase.dart';

@GenerateMocks([AuthenticationRepository, AuthenticationApi,GetUserDataUsecase],
    customMocks: [MockSpec<dio.HttpClientAdapter>(as: #MockHttpClient)])
void main() {}
