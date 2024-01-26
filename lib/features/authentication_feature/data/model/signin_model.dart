// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:movie_app/features/authentication_feature/domain/entities/signin_entity.dart';

class SignInModel extends SignInEntity {
  const SignInModel({
    required String token_type,
    required int expires_in,
    required String access_token,
    required String refresh_token,
  }) : super(
            token_type: token_type,
            expires_in: expires_in,
            access_token: access_token,
            refresh_token: refresh_token);

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      token_type: map['token_type'] as String,
      expires_in: map['expires_in'].toInt() as int,
      access_token: map['access_token'] as String,
      refresh_token: map['refresh_token'] as String,
    );
  }

  factory SignInModel.fromJson(String source) =>
      SignInModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props =>
      [token_type, expires_in, access_token, refresh_token];
}
