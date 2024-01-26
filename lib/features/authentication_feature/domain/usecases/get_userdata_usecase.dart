import 'package:movie_app/core/resources/data_state.dart';
import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';
import 'package:movie_app/features/authentication_feature/domain/repository/authentication_repository.dart';

class GetUserDataUsecase {
  AuthenticationRepository authenticationRepository;
  GetUserDataUsecase(this.authenticationRepository);

  Future<DataState<UserEntity>> call(String email, String password, String name) {
    return authenticationRepository.fetchUserData(email,password,name);
  }
}
