import 'package:refactor/core/error/exceptions.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/network/network_info.dart';
import 'package:refactor/features/favourite/data/datasources/favourite_remote_data_source.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_entity.dart';
import 'package:refactor/features/favourite/domain/repositories/favourite_repository.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  final FavouriteRemoteDataSource favouriteRemoteDataSource;
  final NetWorkInfo netWorkInfo;

  FavouriteRepositoryImpl({
    required this.favouriteRemoteDataSource,
    required this.netWorkInfo,
  });

  @override
  Future<Either<Failure, List<FavouriteEntity>>> getFavourites() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteFavourites =
            await favouriteRemoteDataSource.getFavourites();

        return Right(remoteFavourites);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
