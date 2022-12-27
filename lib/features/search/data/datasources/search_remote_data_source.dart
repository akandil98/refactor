import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/search/domain/entities/search_entity.dart';
import 'package:refactor/features/search/domain/usecases/search_products.dart';

abstract class SearchRemoteDataSource {
  Future<SearchEntity> search(SearchProductsParams params);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiConsumer apiConsumer;

  SearchRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<SearchEntity> search(SearchProductsParams params) async {
    final response = await apiConsumer.post(
      EndPoints.search,
      body: {
        'text': params.text,
      },
    );
    return SearchEntity.fromJson(response);
  }
}
