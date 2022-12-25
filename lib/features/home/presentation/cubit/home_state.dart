part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

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

class ProductIsLoading extends HomeState {}

class ProductLoadedSuccess extends HomeState {
  final ProductEntity productEntity;

  const ProductLoadedSuccess({required this.productEntity});
  @override
  List<Object> get props => [productEntity];
}

class CategoryIsLoading extends HomeState {}

class CategoryLoadedSuccess extends HomeState {
  final CategoryEntity categoryEntity;

  const CategoryLoadedSuccess({required this.categoryEntity});
  @override
  List<Object> get props => [categoryEntity];
}

class HomeError extends HomeState {
  final String msg;

  const HomeError({required this.msg});
  @override
  List<Object> get props => [msg];
}
