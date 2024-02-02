// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/data/data_source/remote/authentication_api.dart';
import 'package:movie_app/features/authentication_feature/data/model/user_model.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:movie_app/features/authentication_feature/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationApi authenticationApi;
  AuthenticationRepositoryImpl({
    required this.authenticationApi,
  });

  // @override
  // Future<DataState<SignInEntity>> fetchSigninData(
  //     String email, String password) async {
  //   try {
  //     Response response = await authenticationApi.signinRequest(
  //         email: email, password: password);
  //     print('---------------------------------------------'+'$response');
  //     if (response.statusCode == 200) {
  //       SignInEntity signInEntity = SignInModel.fromJson(response.data);
  //       return DataSuccess(signInEntity);
  //     } else {
  //       return const DataFailed('Something Went Wrong. try again...');
  //     }
  //   } catch (e) {
  //     return const DataFailed("please check your connection...");
  //   }
  // }

  @override
  Future<DataState<UserEntity>> fetchUserData(
      String email, String password, String name) async {
    Response response;
    try {
       response = await authenticationApi.signUpRequest(
          name: name, email: email, password: password);
      if (response.statusCode == 201) {
        UserEntity userEntity = UserModel.fromJson(response.data);
        return DataSuccess(userEntity);
      } else {
        return const DataFailed('Something Went Wrong. try again...');
      }
    }  on DioException catch (e) {
      return  DataFailed(e.response!.data['errors']);
    }
  }

  // @override
  // Future<DataState<SignInEntity>> refreshToken(String refreshToken) async {
  //   try {
  //     Response response = await authenticationApi.refreshTokenRequest(
  //         refreshToken: refreshToken);
  //     if (response.statusCode == 200) {
  //       SignInEntity signInEntity = SignInModel.fromJson(response.data);
  //       return DataSuccess(signInEntity);
  //     } else {
  //       return const DataFailed('Something Went Wrong. try again...');
  //     }
  //   } catch (e) {
  //     return const DataFailed("please check your connection...");
  //   }
  // }
}
