import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/auth/domain/entities/token_entity.dart';
import 'package:refactor/features/auth/domain/repositories/auth_repository.dart';

class UserLogin implements UseCase<TokenEntity, UserLoginParams> {
  final AuthRepository authRepository;

  UserLogin({required this.authRepository});
  @override
  Future<Either<Failure, TokenEntity>> call(UserLoginParams params) async =>
      await authRepository.userLogin(params);
}

class UserLoginParams extends Equatable {
  final String email;
  final String password;

  const UserLoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
