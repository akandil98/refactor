import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/usecases/change_favourite.dart';

abstract class HomeRemoteDataSource {
  Future<ProductEntity> getProduct();
  Future<CategoryEntity> getCategory();
  Future<FavouriteEntity> getFavourite();
  Future<ChangeFavouriteEntity> changeFavourite(ChangeFavouriteParams params);
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

  @override
  Future<FavouriteEntity> getFavourite() async {
    final response = await apiConsumer.get(EndPoints.favourites);
    return FavouriteEntity.fromJson(response);
  }

  @override
  Future<ChangeFavouriteEntity> changeFavourite(
      ChangeFavouriteParams params) async {
    final response = await apiConsumer.post(
      EndPoints.favourites,
      body: {
        'product_id': params.productId,
      },
    );
    return ChangeFavouriteEntity.fromJson(response);
  }
}
