import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movies_feature/domain/usecases/get_movie_details_usecase.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetMovieDetailsUsecase getMovieDetailsUsecase;

  MovieBloc({required this.getMovieDetailsUsecase})
      : super(const MovieLoading()) {
    on<LoadMovie>((event, emit) async {
      emit(const MovieLoading());
      DataState<MovieEntity> dataState = await getMovieDetailsUsecase(event.id);
      if (dataState is DataSuccess) {
        emit(MovieLoaded(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(MovieFaild(dataState.error!));
      }
    });
    // on<LoadListMovie>((event, emit) async {
    //   DataState dataState = await getMovieListUsecase(event.page);
    //   if (dataState is DataSuccess) {
    //     emit(state.copyWith(
    //         newMovieListStatus: MovieListCompleted(dataState.data)));
    //   }
    //   if (dataState is DataFailed) {
    //     emit(state.copyWith(
    //         newMovieListStatus: MovieListError(dataState.error!)));
    //   }
    // });
  }
}
