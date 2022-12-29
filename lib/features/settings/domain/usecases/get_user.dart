import 'package:dartz/dartz.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/settings/domain/repositories/settings_repository.dart';

class GetUser implements UseCase<UserEntity, NoParams> {
  final SettingsRepository settingsRepository;

  GetUser({required this.settingsRepository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await settingsRepository.getUser();
  }
}
