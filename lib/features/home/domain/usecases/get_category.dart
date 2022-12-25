import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class GetCategory implements UseCase<CategoryEntity, NoParams> {
  final HomeRepository homeRepository;

  GetCategory({required this.homeRepository});
  @override
  Future<Either<Failure, CategoryEntity>> call(NoParams params) async {
    return await homeRepository.getCategory();
  }
}
