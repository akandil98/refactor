part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {}

class HomeIsLoading extends HomeState {}

class HomeLoadedSuccess extends HomeState {}

class HomeError extends HomeState {
  final String msg;

  const HomeError({required this.msg});
  @override
  List<Object> get props => [msg];
}
