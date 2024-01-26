import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/signin_entity.dart';
import 'package:movie_app/features/authentication_feature/domain/repository/authentication_repository.dart';

class GetUserDataUsecase {
  AuthenticationRepository authenticationRepository;
  GetUserDataUsecase(this.authenticationRepository);

  Future<DataState<SignInEntity>> call(
    String refreshToken,
  ) {
    return authenticationRepository.refreshToken(refreshToken);
  }
}
