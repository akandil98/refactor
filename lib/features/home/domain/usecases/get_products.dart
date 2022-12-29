import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class GetProducts implements UseCase<List<ProductEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetProducts({required this.homeRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await homeRepository.getProducts();
  }
}
