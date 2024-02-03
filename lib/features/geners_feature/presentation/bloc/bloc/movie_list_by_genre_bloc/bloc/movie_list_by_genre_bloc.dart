import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/geners_feature/domain/entities/movie_list_by_genres.dart';
import 'package:movie_app/features/geners_feature/domain/usecases/get_movie_list_by_genres_usecase.dart';

part 'movie_list_by_genre_event.dart';
part 'movie_list_by_genre_state.dart';

class MovieListByGenreBloc
    extends Bloc<MovieListByGenreEvent, MovieListByGenreState> {
  GetMovieListByGenretUsecase getMovieListByGenretUsecase;
  MovieListByGenreBloc({required this.getMovieListByGenretUsecase})
      : super(const MovieListByGenreLoading()) {
    on<MovieListByGenreEvent>((event, emit) {
      on<LoadMovieListByGenreEvent>((event, emit) async {
        emit(const MovieListByGenreLoading());
        DataState<MovieListByGenreEntitie> dataState =
            await getMovieListByGenretUsecase(event.page, event.genreId);
        if (dataState is DataSuccess) {
          emit(MovieListByGenreLoaded(dataState.data!));
        } else {
          emit(MovieListByGenreFaild(dataState.error!));
        }
      });
    });
  }
}
