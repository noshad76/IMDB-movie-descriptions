import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../test_helper/test_helper.mocks.dart';

void main() {
  late MockGetUserDataUsecase mockGetUserDataUsecase;
  late AuthenticationBloc authenticationBloc;

  setUp(() {
    mockGetUserDataUsecase = MockGetUserDataUsecase();
    authenticationBloc = AuthenticationBloc(mockGetUserDataUsecase);
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
  test('initial state should be initstate', () {
    expect(authenticationBloc.state, const AuthenticationInit());
  });

  blocTest<AuthenticationBloc, AuthenticationState>(
    'emits [AuthenticationLoading,AuthenticationDone] when get data is sucsses .',
    build: () {
      when(mockGetUserDataUsecase.call(email, password, name))
          .thenAnswer((realInvocation) async {
        return const DataSuccess(testUserDetails);
      });
      return authenticationBloc;
    },
    act: (bloc) => bloc.add(SignUpInApp(email: email, password: password)),
    expect: () => const <AuthenticationState>[
      AuthenticationLoading(),
      AuthenticationDone(testUserDetails)
    ],
  );
  blocTest<AuthenticationBloc, AuthenticationState>(
    'emits [AuthenticationLoading,AuthenticationDone] when get data is unsucsses.',
    build: () {
      when(mockGetUserDataUsecase.call(email, password, name))
          .thenAnswer((realInvocation) async {
        return const DataFailed('Server failure');
      });
      return authenticationBloc;
    },
    act: (bloc) => bloc.add(SignUpInApp(email: email, password: password)),
    expect: () => const <AuthenticationState>[
      AuthenticationLoading(),
      AuthenticationFaild('Server failure')
    ],
  );
}
