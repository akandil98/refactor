import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_entity.dart';

abstract class FavouriteRemoteDataSource {
  Future<List<FavouriteEntity>> getFavourites();
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
}
