import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:movie_app/features/authentication_feature/domain/usecases/get_userdata_usecase.dart';

import '../../../../test_helper/test_helper.mocks.dart';

void main() {
  late MockAuthenticationRepository mockAuthenticationRepository;
  late GetUserDataUsecase getUserDataUsecase;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    getUserDataUsecase = GetUserDataUsecase(
        authenticationRepository: mockAuthenticationRepository);
  });

  const testUserDetails = UserEntity(
      id: 1,
      name: 'amir',
      email: 'amirpishon@gmail.com',
      createdAt: '2020-10-10 12:12:23',
      updatedAt: '2020-10-10 12:12:23');

  String name = 'amir';
  String email = 'amirpishon@gmail.com';
  String password = 'amir1382';

  test(
    'Should get User data from repository',
    () async {
      //arrange
      when(mockAuthenticationRepository.fetchUserData(email, password, name))
          .thenAnswer(
              (realInvocation) async => const DataSuccess(testUserDetails));


      //act
      final resault = await getUserDataUsecase.call(email, password, name);


      //assert
      expect(resault, equals(const DataSuccess(testUserDetails)));
    },
  );
}
