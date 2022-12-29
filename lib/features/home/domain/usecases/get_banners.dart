import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';

import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class GetBanners implements UseCase<List<BannerEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetBanners({required this.homeRepository});

  @override
  Future<Either<Failure, List<BannerEntity>>> call(NoParams params) async {
    return await homeRepository.getBanners();
  }
}
