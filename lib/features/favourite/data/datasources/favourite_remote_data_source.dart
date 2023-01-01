import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/favourite/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_entity.dart';
import 'package:refactor/features/favourite/domain/usecases/change_item_from_favourite.dart';

abstract class FavouriteRemoteDataSource {
  Future<List<FavouriteEntity>> getFavourites();
  Future<ChangeFavouriteEntity> changeFavourite(ChangeFavouriteParams params);
}

class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  final ApiConsumer apiConsumer;

  FavouriteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<FavouriteEntity>> getFavourites() async {
    final respone = await apiConsumer.get(EndPoints.favourites);
    return (respone['data']['data'] as List)
        .map((e) => FavouriteEntity.fromJson(e))
        .toList();
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
    return ChangeFavouriteEntity.fromJson(response['data']);
  }
}
