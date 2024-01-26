import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/geners_feature/domain/usecases/get_genres_list_usecase.dart';
import 'package:movie_app/features/geners_feature/domain/usecases/get_movie_list_by_genres_usecase.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/genres_list_status.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/movie_list_by_genre_status.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GetGenreListUsecase getGenreListUsecase;
  GetMovieListByGenretUsecase getMovieListByGenretUsecase;
  GenreBloc(this.getGenreListUsecase, this.getMovieListByGenretUsecase)
      : super(GenreState(
            genreListStatus: GenereListLoding(),
            movieListByGenreStatus: MovieListByGenreLoding())) {
    on<LoadGenreList>((event, emit) async {
      emit(state.copyWith(newGenreListStatus: GenereListLoding()));
      DataState dataState = await getGenreListUsecase();
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newGenreListStatus: GenreListCompleted(dataState.data)));
      } else {
        emit(state.copyWith(
            newGenreListStatus: GenreListError(dataState.error!)));
      }
    });

    on<LoadMovieListByGenere>((event, emit) async {
      emit(state.copyWith(newMovieListByGenreStatus: MovieListByGenreLoding()));
      DataState dataState =
          await getMovieListByGenretUsecase(event.page, event.genereId);
      if (dataState is DataSuccess) {
        emit(state.copyWith(
            newMovieListByGenreStatus:
                MovieListByGenreCompleted(dataState.data)));
      } else {
        emit(state.copyWith(
            newMovieListByGenreStatus: MovieListByGenreError(dataState.error!)));
      }
    });
  }
}
