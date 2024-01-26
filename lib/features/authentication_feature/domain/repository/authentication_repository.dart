import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/signin_entity.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';

abstract class AuthenticationRepository {
 Future< DataState<UserEntity>> fetchUserData(
      String email, String password, String name);
  Future<DataState<SignInEntity>> fetchSigninData(String email, String password);
  Future<DataState<SignInEntity>> refreshToken(String refreshToken,);
}
