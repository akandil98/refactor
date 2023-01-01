import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/favourite/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_entity.dart';
import 'package:refactor/features/favourite/domain/usecases/change_item_from_favourite.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, List<FavouriteEntity>>> getFavourites();
  Future<Either<Failure, ChangeFavouriteEntity>> changeFavourite(
      ChangeFavouriteParams params);
}
