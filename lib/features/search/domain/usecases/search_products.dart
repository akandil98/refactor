import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/search/domain/entities/search_entity.dart';
import 'package:refactor/features/search/domain/repositories/search_repository.dart';

class SearchProducts implements UseCase<SearchEntity, SearchProductsParams> {
  final SearchRepository searchRepository;

  SearchProducts({required this.searchRepository});

  @override
  Future<Either<Failure, SearchEntity>> call(SearchProductsParams params) {
    return searchRepository.search(params);
  }
}

class SearchProductsParams extends Equatable {
  final String text;

  const SearchProductsParams({required this.text});

  @override
  List<Object?> get props => [text];
}
