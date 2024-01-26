// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final SignInStatus signInStatus;
  final SignUpStatus signUpStatus;
  const AuthenticationState({
    required this.signInStatus,
    required this.signUpStatus,
  });
  AuthenticationState copyWith(
      SignInStatus? newSignInStatus, SignUpStatus? newSignUpStatus) {
    return AuthenticationState(
        signInStatus: newSignInStatus ?? signInStatus,
        signUpStatus: newSignUpStatus ?? signUpStatus);
  }

  @override
  List<Object?> get props => [signInStatus, signUpStatus];
}
