import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/features/authentication_feature/data/model/user_model.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';

import '../../../../test_helper/json_reader.dart';

void main() {
  const userEntity = UserEntity(
      id: 1,
      name: 'amir',
      email: 'amirpishon@gmail.com',
      createdAt: '2020-10-10 12:12:23',
      updatedAt: '2020-10-10 12:12:23');
  const userModel = UserModel(
      id: 1,
      name: 'amir',
      email: 'amirpishon@gmail.com',
      createdAt: '2020-10-10 12:12:23',
      updatedAt: '2020-10-10 12:12:23');

  group('user entity is user model ', () {
    test('should be a subclass of user entity', () {
      //assert
      final result = userModel.toEntity();
      expect(result, equals(userEntity));
    });
  });

  group('fromJson', () {
    test('should return a valid model from json', () {
      //arrange
      final Map<String, dynamic> jsonMap = jsonDecode(
        readJson('test_helper/dummy_data/dummy_userdata.json'),
      );

      //act
      final resault = UserModel.fromJson(jsonMap);

      //assert
      expect(resault, equals(userModel));
    });
  });
}
