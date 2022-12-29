import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/settings/domain/repositories/settings_repository.dart';

class UpdateUser implements UseCase<UserEntity, UpdateUserParams> {
  final SettingsRepository settingsRepository;

  UpdateUser({required this.settingsRepository});
  @override
  Future<Either<Failure, UserEntity>> call(UpdateUserParams params) async =>
      await settingsRepository.updateUser(params);
}

class UpdateUserParams extends Equatable {
  final String name;
  final String email;
  final String phone;

  const UpdateUserParams({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, email, phone];
}
