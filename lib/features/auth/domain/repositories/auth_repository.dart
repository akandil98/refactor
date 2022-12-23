import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/auth/domain/entities/token_entity.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/auth/domain/usecases/user_login.dart';
import 'package:refactor/features/auth/domain/usecases/user_register.dart';

abstract class AuthRepository {
  Future<Either<Failure, TokenEntity>> userLogin(UserLoginParams params);

  Future<Either<Failure, UserEntity>> userRegister(UserRegisterParams params);
}
