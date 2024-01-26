import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/signin_entity.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:movie_app/features/authentication_feature/domain/usecases/get_signindata_usecase.dart';
import 'package:movie_app/features/authentication_feature/domain/usecases/get_userdata_usecase.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/signin_status.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/signup_status.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  GetSignInDataUsecase getSignInDataUsecase;
  GetUserDataUsecase getUserDataUsecase;

  AuthenticationBloc(this.getSignInDataUsecase, this.getUserDataUsecase)
      : super(AuthenticationState(
            signInStatus: SignInLoading(), signUpStatus: SignUpLoading())) {
    on<SignInToApp>((event, emit)async {
      emit(state.copyWith(SignInLoading(), null));
      DataState<SignInEntity> dataState =await getSignInDataUsecase(event.email,event.password);
      if (dataState is DataSuccess) {
         emit(state.copyWith(SignInCompleted(signInEntity: dataState.data!), null));
        
      }else if(dataState is DataFailed){
         emit(state.copyWith(SignInError(dataState.error!), null));

      }
    });


     on<SignUpInApp>((event, emit)async {
      emit(state.copyWith(null, SignUpLoading()));
      DataState<UserEntity> dataState =await getUserDataUsecase(event.email,event.password,event.name);
      if (dataState is DataSuccess) {
         emit(state.copyWith(null, SignUpCompleted(userEntity: dataState.data!)));
        
      }else if(dataState is DataFailed){
         emit(state.copyWith(null, SignUpError(dataState.error!)));

      }
    });
  }
}
