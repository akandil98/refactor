import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BannerEntity>>> getBanners();
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
