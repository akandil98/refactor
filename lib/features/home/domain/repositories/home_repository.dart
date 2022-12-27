import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/usecases/change_favourite.dart';
import 'package:refactor/features/home/domain/usecases/update_user.dart';

abstract class HomeRepository {
  Future<Either<Failure, ProductEntity>> getProduct();
  Future<Either<Failure, CategoryEntity>> getCategory();
  Future<Either<Failure, FavouriteEntity>> getFavourite();
  Future<Either<Failure, ChangeFavouriteEntity>> changeFavourite(
      ChangeFavouriteParams params);
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, UserEntity>> updateUser(UpdateUserParams params);
}
