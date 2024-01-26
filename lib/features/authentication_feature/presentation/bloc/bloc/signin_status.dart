// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movie_app/features/authentication_feature/domain/entities/signin_entity.dart';

abstract class SignInStatus extends Equatable {}

class SignInLoading extends SignInStatus {
  @override
  List<Object?> get props => [];
}

class SignInCompleted extends SignInStatus {
  final SignInEntity signInEntity;
  SignInCompleted({
    required this.signInEntity,
  });

  @override
  List<Object?> get props => [signInEntity];
}

class SignInError extends SignInStatus {
  final String message;
  SignInError(this.message);

  @override
  List<Object?> get props => [message];
}
