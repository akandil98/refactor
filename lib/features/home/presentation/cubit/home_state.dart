part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// home layout states
class HomeInitialState extends HomeState {}

class ChangeBottomNavState extends HomeState {}

class HomeIsLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String msg;

  const HomeErrorState({required this.msg});
  @override
  List<Object> get props => [msg];
}

class HomeLoadedState extends HomeState {}

class HomeGetBannersLoadedState extends HomeState {}

class HomeGetProductsLoadedState extends HomeState {}

class HomeGetCategoriesLoadedState extends HomeState {}

class HomeGetFavoriteItemsLoadedState extends HomeState {}
