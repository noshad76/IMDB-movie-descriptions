import 'package:movie_app/features/authentication_feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    required String name,
    required String email,
    required String createdAt,
    required String updatedAt,
  }) : super(
            id: id,
            name: name,
            email: email,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  UserEntity toEntity() => UserEntity(
      id: id,
      name: name,
      email: email,
      createdAt: createdAt,
      updatedAt: updatedAt);
}
