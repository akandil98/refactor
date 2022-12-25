import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<ProductEntity> getProduct();
  Future<CategoryEntity> getCategory();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ProductEntity> getProduct() async {
    final response = await apiConsumer.get(EndPoints.home);
    return ProductEntity.fromJson(response);
  }

  @override
  Future<CategoryEntity> getCategory() async {
    final response = await apiConsumer.get(EndPoints.categories);
    return CategoryEntity.fromJson(response);
  }
}
