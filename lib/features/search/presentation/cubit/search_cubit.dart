import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/search/domain/entities/search_entity.dart';
import 'package:refactor/features/search/domain/usecases/search_products.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchProducts searchProducts;

  SearchCubit({required this.searchProducts}) : super(SearchInitial());

  List<Datum> searchResult = [];

  Future<void> search({
    required String text,
  }) async {
    emit(SearchIsLoading());
    Either<Failure, SearchEntity> response =
        await searchProducts(SearchProductsParams(text: text));

    response.fold(
      (failure) => emit(SearchError(msg: mapFailureToMsg(failure))),
      (searchEntity) {
        searchResult = searchEntity.data.data;

        emit(SearchLoaded(searchEntity: searchEntity));
      },
    );
  }
}
