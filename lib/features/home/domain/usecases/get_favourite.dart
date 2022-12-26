import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/favourite_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class GetFavourite implements UseCase<FavouriteEntity, NoParams> {
  final HomeRepository homeRepository;

  GetFavourite({required this.homeRepository});
  @override
  Future<Either<Failure, FavouriteEntity>> call(NoParams params) async {
    return await homeRepository.getFavourite();
  }
}
