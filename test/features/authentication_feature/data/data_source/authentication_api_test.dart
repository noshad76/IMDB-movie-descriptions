import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/features/authentication_feature/data/data_source/remote/authentication_api.dart';

import '../../../../test_helper/json_reader.dart';

void main() {
  late AuthenticationApi authenticationApi;
  late final Dio dio;
  late final DioAdapter dioAdapter;
  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
    authenticationApi = AuthenticationApi(dio: dio);
  });

  group("get user data", () {
    final Map<String, dynamic> jsonMap = jsonDecode(
      readJson('test_helper/dummy_data/dummy_userdata.json'),
    );
    
    String name = 'amir';
    String email = 'amirpishon@gmail.com';
    String password = 'amir1382';

    test('should return user model when the response code is 201 ', () async {
      //arrange
      when(dioAdapter.onPost("https://moviesapi.ir/api/v1/register", (server) {
        server.reply(201, jsonMap);
      }, data: {"name": name, "email": email, "password": password}));
      //act
      final resault = await authenticationApi.signUpRequest(
          email: email, password: password, name: name);

      //assert
      expect(resault.data, equals(jsonMap));
    });
  });
}
