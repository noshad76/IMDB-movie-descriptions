import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/domain/usecases/get_userdata_usecase.dart';

import '../../../domain/entities/user_entity.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  GetUserDataUsecase getUserDataUsecase;

  AuthenticationBloc(this.getUserDataUsecase)
      : super(const AuthenticationInit()) {
    on<SignUpInApp>((event, emit) async {
      emit(AuthenticationLoading());

      DataState<UserEntity> dataState =
          await getUserDataUsecase(event.email, event.password, event.name);

      if (dataState is DataSuccess) {
        emit(AuthenticationDone(dataState.data!));
        print(dataState.data);
      } else if (dataState is DataFailed) {
        emit(AuthenticationFaild(dataState.error!));
        print(dataState.error);
      }
    });
  }
}
