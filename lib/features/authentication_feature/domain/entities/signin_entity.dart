// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  
  final String token_type;
  final int expires_in;
  final String access_token;
  final String refresh_token;
  const SignInEntity({
    required this.token_type,
    required this.expires_in,
    required this.access_token,
    required this.refresh_token,
  });

  @override
  List<Object> get props =>
      [token_type, expires_in, access_token, refresh_token];
}
