part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthIsLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final TokenEntity tokenEntity;

  const AuthLoginSuccess({required this.tokenEntity});

  @override
  List<Object> get props => [tokenEntity];
}

class AuthRegisterSuccess extends AuthState {
  final UserEntity userEntity;

  const AuthRegisterSuccess({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

class AuthError extends AuthState {
  final String msg;

  const AuthError({required this.msg});
  @override
  List<Object> get props => [msg];
}

class ChangePasswordVisibilityState extends AuthState {}
