import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/data/model/user_model.dart';

import 'package:movie_app/features/authentication_feature/data/repository/authentication_repository_impl.dart';

import '../../test_helper/json_reader.dart';
import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockAuthenticationApi mockAuthenticationApi;
  late AuthenticationRepositoryImpl authenticationRepositoryImpl;

  setUp(() {
    mockAuthenticationApi = MockAuthenticationApi();
    authenticationRepositoryImpl =
        AuthenticationRepositoryImpl(authenticationApi: mockAuthenticationApi);
  });

  group('fetch user data from data srouce', () {
    final Map<String, dynamic> jsonMap = jsonDecode(
      readJson('features/authentication_feature/test_helper/dummy_data/dummy_userdata.json'),
    );
    final Map<String, dynamic> error = jsonDecode(
      readJson('features/authentication_feature/test_helper/dummy_data/dummy_user_error.json'),
    );

    String name = 'amir';
    String email = 'amirpishon@gmail.com';
    String password = 'amir1382';

    const userModel = UserModel(
        id: 1,
        name: 'amir',
        email: 'amirpishon@gmail.com',
        createdAt: '2020-10-10 12:12:23',
        updatedAt: '2020-10-10 12:12:23');
    test('repository should return User entity', () async {
      //arrange
      when(mockAuthenticationApi.signUpRequest(
              name: name, email: email, password: password))
          .thenAnswer((realInvocation) async {
        return Response(
            requestOptions: RequestOptions(), statusCode: 201, data: jsonMap);
      });
      //act
      final result = await authenticationRepositoryImpl.fetchUserData(
          email, password, name);

      expect(result.data,const DataSuccess(userModel).data);
    });
    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockAuthenticationApi.signUpRequest(
                name: name, email: email, password: password))
            .thenThrow(DioException(
                requestOptions: RequestOptions(),
                response:
                    Response(requestOptions: RequestOptions(), data: error)));

        // act
        final result = await authenticationRepositoryImpl.fetchUserData(
            email, password, name);

        // assert
        expect(
            result.error,
            equals(
                const DataFailed("The email has already been taken.;").error));
      },
    );
  });
}
