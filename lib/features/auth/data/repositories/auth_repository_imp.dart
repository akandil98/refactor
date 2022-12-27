import 'package:refactor/core/error/exceptions.dart';
import 'package:refactor/core/network/network_info.dart';
import 'package:refactor/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:refactor/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:refactor/features/auth/domain/entities/token_entity.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/features/auth/domain/repositories/auth_repository.dart';
import 'package:refactor/features/auth/domain/usecases/user_register.dart';
import 'package:refactor/features/auth/domain/usecases/user_login.dart';

class AuthRepositoryImp implements AuthRepository {
  final NetWorkInfo netWorkInfo;
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImp({
    required this.netWorkInfo,
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });
  @override
  Future<Either<Failure, TokenEntity>> userLogin(UserLoginParams params) async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteToken = await authRemoteDataSource.userLogin(params);
        // caching token after login
        authLocalDataSource.cacheToken(remoteToken);
        return Right(remoteToken);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> userRegister(
      UserRegisterParams params) async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteUser = await authRemoteDataSource.userRegister(params);

        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
