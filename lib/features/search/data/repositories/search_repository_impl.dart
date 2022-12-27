import 'package:refactor/core/error/exceptions.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/network/network_info.dart';
import 'package:refactor/features/search/data/datasources/search_remote_data_source.dart';
import 'package:refactor/features/search/domain/entities/search_entity.dart';
import 'package:refactor/features/search/domain/repositories/search_repository.dart';
import 'package:refactor/features/search/domain/usecases/search_products.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  final NetWorkInfo netWorkInfo;

  SearchRepositoryImpl({
    required this.searchRemoteDataSource,
    required this.netWorkInfo,
  });

  @override
  Future<Either<Failure, SearchEntity>> search(
      SearchProductsParams params) async {
    if (await netWorkInfo.isConnected) {
      try {
        final remoteSearch = await searchRemoteDataSource.search(params);
        return Right(remoteSearch);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
