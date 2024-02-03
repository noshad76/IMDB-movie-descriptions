part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  final UserEntity? userEntity;
  final String? error;
  const AuthenticationState({
    this.userEntity,
    this.error,
  });
  @override
  List<Object?> get props => [userEntity, error];
}

class AuthenticationInit extends AuthenticationState {
  const AuthenticationInit();
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

class AuthenticationDone extends AuthenticationState {
  const AuthenticationDone(UserEntity userEntity)
      : super(userEntity: userEntity);
}

class AuthenticationFaild extends AuthenticationState {
  const AuthenticationFaild(String error) : super(error: error);
}
