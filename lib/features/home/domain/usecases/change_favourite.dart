import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class ChangeFavourite
    implements UseCase<ChangeFavouriteEntity, ChangeFavouriteParams> {
  final HomeRepository homeRepository;

  ChangeFavourite({required this.homeRepository});

  @override
  Future<Either<Failure, ChangeFavouriteEntity>> call(
      ChangeFavouriteParams params) async {
    return await homeRepository.changeFavourite(params);
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
