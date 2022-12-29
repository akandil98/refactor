import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/usecases/change_favourite.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanners();
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();

  Future<Either<Failure, FavouriteEntity>> getFavourite();
  Future<Either<Failure, ChangeFavouriteEntity>> changeFavourite(
      ChangeFavouriteParams params);
}
