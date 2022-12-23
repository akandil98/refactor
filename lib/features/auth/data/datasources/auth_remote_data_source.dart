import 'package:refactor/features/auth/domain/entities/token_entity.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/auth/domain/usecases/user_login.dart';
import 'package:refactor/features/auth/domain/usecases/user_register.dart';

abstract class AuthRemoteDataSource {
  Future<TokenEntity> userLogin(UserLoginParams params);
  Future<UserEntity> userRegister(UserRegisterParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<TokenEntity> userLogin(UserLoginParams params) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> userRegister(UserRegisterParams params) {
    // TODO: implement userRegister
    throw UnimplementedError();
  }
}
