import 'package:refactor/core/error/exceptions.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/network/network_info.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:refactor/features/settings/domain/repositories/settings_repository.dart';
import 'package:refactor/features/settings/domain/usecases/update_user.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource settingsRemoteDataSource;
  final NetWorkInfo netWorkInfo;

  SettingsRepositoryImpl({
    required this.settingsRemoteDataSource,
    required this.netWorkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteUser = await settingsRemoteDataSource.getUser();

        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUser(
      UpdateUserParams params) async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteUpdateUser =
            await settingsRemoteDataSource.updateUser(params);
        return Right(remoteUpdateUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
