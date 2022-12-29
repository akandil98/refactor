part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// home layout states
class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {}

class HomeIsLoading extends HomeState {}

class HomeLoaded extends HomeState {
  // final ProductEntity productEntity;
  // final CategoryEntity categoryEntity;

  // const HomeLoaded({
  //   required this.productEntity,
  //   required this.categoryEntity,
  // });
  // @override
  // List<Object> get props => [productEntity, categoryEntity];
}

class HomeError extends HomeState {
  final String msg;

  const HomeError({required this.msg});
  @override
  List<Object> get props => [msg];
}

// product states
class ProductIsLoading extends HomeState {}

class ProductLoaded extends HomeState {
  final HomeEntity homeEntity;

  const ProductLoaded({required this.homeEntity});
  @override
  List<Object> get props => [homeEntity];
}

class ProductError extends HomeState {
  final String msg;

  const ProductError({required this.msg});
  @override
  List<Object> get props => [msg];
}

// category states
class CategoryIsLoading extends HomeState {}

class CategoryLoaded extends HomeState {
  final CategoryEntity categoryEntity;

  const CategoryLoaded({required this.categoryEntity});
  @override
  List<Object> get props => [categoryEntity];
}

class CategoryError extends HomeState {
  final String msg;

  const CategoryError({required this.msg});
  @override
  List<Object> get props => [msg];
}

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
