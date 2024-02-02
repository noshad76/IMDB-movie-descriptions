import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/authentication_feature/data/data_source/remote/authentication_api.dart';
import 'package:movie_app/features/authentication_feature/data/repository/authentication_repository_impl.dart';
import 'package:movie_app/features/authentication_feature/domain/repository/authentication_repository.dart';
import 'package:movie_app/features/authentication_feature/domain/usecases/get_userdata_usecase.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/authentication_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio
  getIt.registerSingleton<Dio>(Dio());
  
  //api
  getIt.registerSingleton<AuthenticationApi>(AuthenticationApi(dio: getIt()));

  //repositories
  getIt.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(authenticationApi: getIt()));

  // usecases
  getIt.registerSingleton<GetUserDataUsecase>(
      GetUserDataUsecase(authenticationRepository: getIt()));

  //bloc
  getIt.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(getIt(),));
}
