import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/search/domain/entities/search_entity.dart';
import 'package:refactor/features/search/domain/usecases/search_products.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchEntity>> search(SearchProductsParams params);
}
