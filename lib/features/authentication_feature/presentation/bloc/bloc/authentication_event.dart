// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {}

class SignInToApp extends AuthenticationEvent {
  final String email;
  final String password;
  SignInToApp({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}

class SignUpInApp extends AuthenticationEvent {
  final String email;
  final String password;
  final String name;
  SignUpInApp({
    required this.email,
    required this.password,
    required this.name,
  });
  @override
  List<Object?> get props => [email, password, name];
}
