import 'package:refactor/core/api/api_consumer.dart';
import 'package:refactor/core/api/end_points.dart';
import 'package:refactor/features/home/domain/entities/home_entity.dart';

abstract class HomeRemoteDataSource {
  Future<HomeEntity> getHome();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<HomeEntity> getHome() async {
    final response = await apiConsumer.get(EndPoints.home);
    return HomeEntity.fromJson(response);
  }
}
