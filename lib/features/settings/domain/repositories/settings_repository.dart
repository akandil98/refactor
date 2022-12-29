import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/settings/domain/usecases/update_user.dart';

abstract class SettingsRepository {
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, UserEntity>> updateUser(UpdateUserParams params);
}
