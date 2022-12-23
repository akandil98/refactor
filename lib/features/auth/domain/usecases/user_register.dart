import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/auth/domain/repositories/auth_repository.dart';

class UserRegister implements UseCase<UserEntity, UserRegisterParams> {
  final AuthRepository authRepository;

  UserRegister({required this.authRepository});
  @override
  Future<Either<Failure, UserEntity>> call(UserRegisterParams params) async =>
      await authRepository.userRegister(params);
}

class UserRegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;

  const UserRegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, email, password, phone];
}
