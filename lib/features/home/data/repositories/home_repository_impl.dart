import 'package:refactor/core/error/exceptions.dart';
import 'package:refactor/core/network/network_info.dart';
import 'package:refactor/features/home/data/datasources/home_remote_data_source.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/favourite_entity.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';
import 'package:refactor/features/home/domain/usecases/change_favourite.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetWorkInfo netWorkInfo;

  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.netWorkInfo,
  });

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteBanners = await homeRemoteDataSource.getBanners();

        return Right(remoteBanners);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteProducts = await homeRemoteDataSource.getProducts();

        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteCategirues = await homeRemoteDataSource.getCategories();

        return Right(remoteCategirues);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FavouriteEntity>> getFavourite() async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteFavourites = await homeRemoteDataSource.getFavourite();

        return Right(remoteFavourites);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ChangeFavouriteEntity>> changeFavourite(
      ChangeFavouriteParams params) async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteChangeFavourite =
            await homeRemoteDataSource.changeFavourite(params);
        return Right(remoteChangeFavourite);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
