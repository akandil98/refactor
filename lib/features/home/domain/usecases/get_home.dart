import 'package:refactor/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/home_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class GetHome implements UseCase<HomeEntity, NoParams> {
  final HomeRepository homeRepository;

  GetHome({required this.homeRepository});

  @override
  Future<Either<Failure, HomeEntity>> call(NoParams params) async {
    return await homeRepository.getHome();
  }
}
