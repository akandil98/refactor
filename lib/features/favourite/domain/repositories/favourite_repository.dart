import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_entity.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, List<FavouriteEntity>>> getFavourites();
}
