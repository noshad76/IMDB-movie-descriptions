import 'package:equatable/equatable.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';

abstract class SignUpStatus extends Equatable {}

class SignUpLoading extends SignUpStatus {
  @override
  List<Object?> get props => [];
}

class SignUpCompleted extends SignUpStatus {
  final UserEntity userEntity;
  SignUpCompleted({
    required this.userEntity,
  });

  @override
  List<Object?> get props => [userEntity];
}

class SignUpError extends SignUpStatus {
  final String message;
  SignUpError(this.message);

  @override
  List<Object?> get props => [message];
}
