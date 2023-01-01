import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/favourite/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/favourite/domain/repositories/favourite_repository.dart';

class ChangeFavourite
    extends UseCase<ChangeFavouriteEntity, ChangeFavouriteParams> {
  final FavouriteRepository favouriteRepository;

  ChangeFavourite({required this.favouriteRepository});

  @override
  Future<Either<Failure, ChangeFavouriteEntity>> call(
      ChangeFavouriteParams params) async {
    return await favouriteRepository.changeFavourite(params);
  }
}

class ChangeFavouriteParams extends Equatable {
  final int productId;

  const ChangeFavouriteParams({
    required this.productId,
  });

  @override
  List<Object?> get props => [productId];
}
