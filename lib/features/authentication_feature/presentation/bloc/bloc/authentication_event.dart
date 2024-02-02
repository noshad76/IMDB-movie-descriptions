// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {}

class SignUpInApp extends AuthenticationEvent {
  late final String email;
  late final String password;
  final String name = 'amir';
  SignUpInApp({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password, name];
}
