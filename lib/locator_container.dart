import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/authentication_feature/data/data_source/remote/authentication_api.dart';
import 'package:movie_app/features/authentication_feature/data/repository/authentication_repository_impl.dart';
import 'package:movie_app/features/authentication_feature/domain/repository/authentication_repository.dart';
import 'package:movie_app/features/authentication_feature/domain/usecases/get_userdata_usecase.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:movie_app/features/geners_feature/data/data_source/remote/genres_api.dart';
import 'package:movie_app/features/geners_feature/data/repository/genres_repsitory_iplm.dart';
import 'package:movie_app/features/geners_feature/domain/repository/genres_repository.dart';
import 'package:movie_app/features/geners_feature/domain/usecases/get_genres_list_usecase.dart';
import 'package:movie_app/features/geners_feature/domain/usecases/get_movie_list_by_genres_usecase.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/genre_list_bloc/genre_bloc.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/movie_list_by_genre_bloc/bloc/movie_list_by_genre_bloc.dart';
import 'package:movie_app/features/movies_feature/data/data_source/remote/movie_api.dart';
import 'package:movie_app/features/movies_feature/data/repository/movie_repository_impl.dart';
import 'package:movie_app/features/movies_feature/domain/repository/movie_repository.dart';
import 'package:movie_app/features/movies_feature/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/features/movies_feature/domain/usecases/get_movie_list_usecase.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //dio
  getIt.registerSingleton<Dio>(Dio());

  //api
  getIt.registerSingleton<AuthenticationApi>(
      AuthenticationApiImpl(dio: getIt()));
  getIt.registerSingleton<MovieApi>(MovieApi(dio: getIt()));
  getIt.registerSingleton<GenrsApi>(GenrsApi(dio: getIt()));
  //repositories
  getIt.registerSingleton<AuthenticationRepository>(
      AuthenticationRepositoryImpl(authenticationApi: getIt()));
  getIt.registerSingleton<MovieRepository>(
      MovieRepositoryImpl(movieApi: getIt()));
  getIt.registerSingleton<GenereRepository>(
      GenereRepositoryImpl(genersApi: getIt()));

  // usecases
  getIt.registerSingleton<GetUserDataUsecase>(
      GetUserDataUsecase(authenticationRepository: getIt()));
  getIt.registerSingleton<GetMovieListUsecase>(GetMovieListUsecase(getIt()));
  getIt.registerSingleton<GetMovieDetailsUsecase>(
      GetMovieDetailsUsecase(getIt()));
  getIt.registerSingleton<GetGenreListUsecase>(GetGenreListUsecase(getIt()));
  getIt.registerSingleton<GetMovieListByGenretUsecase>(
      GetMovieListByGenretUsecase(getIt()));

  //bloc
  getIt.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc(
        getIt(),
      ));
  getIt.registerLazySingleton<MovieListBloc>(() => MovieListBloc(getIt()));
  getIt.registerLazySingleton<MovieBloc>(
      () => MovieBloc(getMovieDetailsUsecase: getIt()));
  getIt.registerLazySingleton<GenreBloc>(() => GenreBloc(getIt()));
  getIt.registerLazySingleton<MovieListByGenreBloc>(
      () => MovieListByGenreBloc(getMovieListByGenretUsecase: getIt()));
}
