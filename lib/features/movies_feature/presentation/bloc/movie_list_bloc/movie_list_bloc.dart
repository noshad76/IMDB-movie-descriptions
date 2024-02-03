// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/resources/data_state.dart';

import 'package:movie_app/features/movies_feature/domain/entities/movie_list_entity.dart';
import 'package:movie_app/features/movies_feature/domain/usecases/get_movie_list_usecase.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  GetMovieListUsecase getMovieListUsecase;
  MovieListBloc(
    this.getMovieListUsecase,
  ) : super(const MovieListLoading()) {
    on<LoadListMovie>((event, emit) async {
      emit(const MovieListLoading());
      DataState<MovieListEntity> dataState =
          await getMovieListUsecase(event.page);

      if (dataState is DataSuccess) {
        emit(MovieListLoaded(dataState.data!));
      } else if (dataState is DataFailed) {
        emit(MovieListFaild(dataState.error!));
      }
    });
  }
}
