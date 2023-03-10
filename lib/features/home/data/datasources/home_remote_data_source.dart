import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerEntity>> getBanners();
  Future<List<ProductEntity>> getProducts();
  Future<List<CategoryEntity>> getCategories();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<BannerEntity>> getBanners() async {
    final respone = await apiConsumer.get(EndPoints.home);
    return (respone['data']['banners'] as List)
        .map((e) => BannerEntity.fromJson(e))
        .toList();
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    final respone = await apiConsumer.get(EndPoints.home);
    return (respone['data']['products'] as List)
        .map((e) => ProductEntity.fromJson(e))
        .toList();
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final respone = await apiConsumer.get(EndPoints.categories);
    return (respone['data']['data'] as List)
        .map((e) => CategoryEntity.fromJson(e))
        .toList();
  }
}
