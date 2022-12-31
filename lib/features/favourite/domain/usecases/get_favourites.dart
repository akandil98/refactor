import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_entity.dart';
import 'package:refactor/features/favourite/domain/repositories/favourite_repository.dart';

class GetFavourites extends UseCase<List<FavouriteEntity>, NoParams> {
  final FavouriteRepository favouriteRepository;

  GetFavourites({required this.favouriteRepository});

  @override
  Future<Either<Failure, List<FavouriteEntity>>> call(NoParams params) async {
    return await favouriteRepository.getFavourites();
  }
}
