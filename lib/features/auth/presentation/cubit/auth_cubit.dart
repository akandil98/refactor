import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/features/auth/domain/entities/token_entity.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/auth/domain/usecases/user_login.dart';
import 'package:refactor/features/auth/domain/usecases/user_register.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserLogin userLogin;
  final UserRegister userRegister;
  AuthCubit({required this.userLogin, required this.userRegister})
      : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    Either<Failure, TokenEntity> response = await userLogin(UserLoginParams(
      email: email,
      password: password,
    ));
    response.fold(
      (failure) => emit(AuthError(msg: mapFailureToMsg(failure))),
      (token) => emit(AuthLoginSuccess(tokenEntity: token)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    Either<Failure, UserEntity> response =
        await userRegister(UserRegisterParams(
      name: name,
      email: email,
      password: password,
      phone: phone,
    ));
    response.fold(
      (failure) => emit(AuthError(msg: mapFailureToMsg(failure))),
      (user) => emit(AuthRegisterSuccess(userEntity: user)),
    );
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }
}
