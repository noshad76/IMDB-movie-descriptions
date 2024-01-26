import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/signin_entity.dart';
import 'package:movie_app/features/authentication_feature/domain/repository/authentication_repository.dart';

class GetSignInDataUsecase {
  AuthenticationRepository authenticationRepository;
  GetSignInDataUsecase(this.authenticationRepository);

  Future<DataState<SignInEntity>> call(String email, String password) {
    return authenticationRepository.fetchSigninData(email, password);
  }
}
