import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/geners_feature/domain/entities/genres_list_entitie.dart';
import 'package:movie_app/features/geners_feature/domain/usecases/get_genres_list_usecase.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreListState> {
  GetGenreListUsecase getGenreListUsecase;
  GenreBloc(this.getGenreListUsecase )
      : super(const GenreListLoading()) {
    on<LoadGenreList>((event, emit) async {
      emit(const GenreListLoading());
      DataState<List<GenrelistEntitie>> dataState = await getGenreListUsecase();
      if (dataState is DataSuccess) {
        emit(GenreListLoaded(dataState.data!));
      } else {
        emit(GenreListFaild(dataState.error!));
      }
    });

   
   
  }
}
