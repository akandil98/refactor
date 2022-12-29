import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/usecases/change_favourite.dart';

abstract class HomeRemoteDataSource {
  Future<List<BannerEntity>> getBanners();
  Future<List<ProductEntity>> getProducts();
  Future<List<CategoryEntity>> getCategories();
  Future<FavouriteEntity> getFavourite();
  Future<ChangeFavouriteEntity> changeFavourite(ChangeFavouriteParams params);
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
