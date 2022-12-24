import 'package:refactor/core/error/exceptions.dart';
import 'package:refactor/core/network/network_info.dart';
import 'package:refactor/features/home/data/datasources/home_remote_data_source.dart';
import 'package:refactor/features/home/domain/entities/home_entity.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetWorkInfo netWorkInfo;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.netWorkInfo,
  });
  @override
  Future<Either<Failure, HomeEntity>> getHome() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteHome = await homeRemoteDataSource.getHome();

        return Right(remoteHome);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
