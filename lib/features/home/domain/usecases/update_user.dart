import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/home/domain/repositories/home_repository.dart';

class UpdateUser implements UseCase<UserEntity, UpdateUserParams> {
  final HomeRepository homeRepository;

  UpdateUser({required this.homeRepository});
  @override
  Future<Either<Failure, UserEntity>> call(UpdateUserParams params) async =>
      await homeRepository.updateUser(params);
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
