part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsIsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final UserEntity userEntity;

  const SettingsLoaded({required this.userEntity});
  @override
  List<Object> get props => [userEntity];
}

class SettingsError extends SettingsState {
  final String msg;

  const SettingsError({required this.msg});
  @override
  List<Object> get props => [msg];
}
