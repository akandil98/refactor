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

//TODO fix favourite state to load without Home loaded
class HomeLoadedState extends HomeState {}

class HomeGetBannersLoadedState extends HomeState {}

class HomeGetProductsLoadedState extends HomeState {}

class HomeGetCategoriesLoadedState extends HomeState {}

// Favourite states
class FavouriteIsLoading extends HomeState {}

class FavouriteLoaded extends HomeState {
  final FavouriteEntity favouriteEntity;

  const FavouriteLoaded({required this.favouriteEntity});
  @override
  List<Object> get props => [favouriteEntity];
}

class FavouriteError extends HomeState {
  final String msg;

  const FavouriteError({required this.msg});
  @override
  List<Object> get props => [msg];
}

//ChangeFavourite state
class ChangeFavouriteState extends HomeState {}

class ChangeFavouriteLoaded extends HomeState {
  final ChangeFavouriteEntity changefavouriteEntity;

  const ChangeFavouriteLoaded({required this.changefavouriteEntity});
  @override
  List<Object> get props => [changefavouriteEntity];
}

class ChangeFavouriteError extends HomeState {
  final String msg;

  const ChangeFavouriteError({required this.msg});
  @override
  List<Object> get props => [msg];
}
