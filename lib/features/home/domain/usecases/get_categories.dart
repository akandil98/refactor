import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class GetCategories implements UseCase<List<CategoryEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetCategories({required this.homeRepository});
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await homeRepository.getCategories();
  }
}
