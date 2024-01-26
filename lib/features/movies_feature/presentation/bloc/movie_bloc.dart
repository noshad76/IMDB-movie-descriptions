import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/movies_feature/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/features/movies_feature/domain/usecases/get_movie_list_usecase.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_list_status.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_status.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetMovieListUsecase getMovieListUsecase;
  GetMovieDetailsUsecase getMovieDetailsUsecase;

  MovieBloc(
      {required this.getMovieDetailsUsecase, required this.getMovieListUsecase})
      : super(MovieState(
            movieStatus: Movieloading(), movieListStatus: MovieListloading())) {
    on<LoadMovie>((event, emit) async {
      emit(state.copyWith(newMovieStatus: Movieloading()));
      DataState dataState = await getMovieDetailsUsecase(event.id);
      if (dataState is DataSuccess) {
        emit(state.copyWith(newMovieStatus: MovieCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(newMovieStatus: MovieError(dataState.error!)));
      }
    });
    on<LoadListMovie>((event, emit) async {
      emit(state.copyWith(newMovieListStatus: MovieListloading()));
      DataState dataState = await getMovieListUsecase(event.page);
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newMovieListStatus: MovieListCompleted(dataState.data)));
      }
      if (dataState is DataFailed) {
        emit(state.copyWith(
            newMovieListStatus: MovieListError(dataState.error!)));
      }
    });
  }
}
