import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/auth/domain/entities/token_entity.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/auth/domain/usecases/user_login.dart';
import 'package:refactor/features/auth/domain/usecases/user_register.dart';

abstract class AuthRemoteDataSource {
  Future<TokenEntity> userLogin(UserLoginParams params);
  Future<UserEntity> userRegister(UserRegisterParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<TokenEntity> userLogin(UserLoginParams params) async {
    final response = await apiConsumer.post(
      EndPoints.login,
      body: {
        'email': params.email,
        'password': params.password,
      },
    );
    return TokenEntity.fromJson(response);
  }

  @override
  Future<UserEntity> userRegister(UserRegisterParams params) async {
    final response = await apiConsumer.post(
      EndPoints.register,
      body: {
        'name': params.name,
        'email': params.email,
        'password': params.password,
        'phone': params.phone,
      },
    );
    return UserEntity.fromJson(response);
  }
}
