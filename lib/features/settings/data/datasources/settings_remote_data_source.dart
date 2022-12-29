import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/settings/domain/usecases/update_user.dart';

abstract class SettingsRemoteDataSource {
  Future<UserEntity> getUser();
  Future<UserEntity> updateUser(UpdateUserParams params);
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final ApiConsumer apiConsumer;

  SettingsRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<UserEntity> getUser() async {
    final response = await apiConsumer.get(
      EndPoints.profile,
    );
    return UserEntity.fromJson(response);
  }

  @override
  Future<UserEntity> updateUser(UpdateUserParams params) async {
    final response = await apiConsumer.put(EndPoints.updateProfile, body: {
      'name': params.name,
      'email': params.email,
      'phone': params.phone,
    });
    return UserEntity.fromJson(response);
  }
}
