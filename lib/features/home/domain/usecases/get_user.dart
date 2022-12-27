import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class GetUser implements UseCase<UserEntity, NoParams> {
  final HomeRepository homeRepository;

  GetUser({required this.homeRepository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await homeRepository.getUser();
  }
}
