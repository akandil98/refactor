import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_entity.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_product_entity.dart';
import 'package:refactor/features/favourite/domain/usecases/get_favourites.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/usecases/get_banners.dart';
import 'package:refactor/features/home/domain/usecases/get_categories.dart';
import 'package:refactor/features/home/domain/usecases/get_products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetBanners getBanners;
  final GetProducts getProducts;
  final GetCategories getCategories;
  final GetFavourites getFavourites;

  HomeCubit({
    required this.getBanners,
    required this.getProducts,
    required this.getCategories,
    required this.getFavourites,
  }) : super(HomeInitialState());

  int currentIndex = 0;

  void changeBottom(int index) {
    emit(HomeInitialState());
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<ProductEntity> products = [];

  Future<void> getProductsList() async {
    emit(HomeIsLoadingState());
    final response = await getProducts(NoParams());

    response
        .fold((failure) => emit(HomeErrorState(msg: mapFailureToMsg(failure))),
            (products) {
      this.products = products;

      emit(HomeGetProductsLoadedState());
    });
  }

  List<BannerEntity> banners = [];

  Future<void> getBannersList() async {
    emit(HomeIsLoadingState());
    final response = await getBanners(NoParams());

    response
        .fold((failure) => emit(HomeErrorState(msg: mapFailureToMsg(failure))),
            (banners) {
      this.banners = banners;

      emit(HomeGetBannersLoadedState());
    });
  }

  List<CategoryEntity> categories = [];

  Future<void> getCategoriesList() async {
    emit(HomeIsLoadingState());
    final response = await getCategories(NoParams());

    response
        .fold((failure) => emit(HomeErrorState(msg: mapFailureToMsg(failure))),
            (categories) {
      this.categories = categories;
      emit(HomeGetCategoriesLoadedState());
    });
  }

  List<FavouriteEntity> favouriteItems = [];

  Future<void> getFavouriteItems() async {
    emit(HomeIsLoadingState());
    final response = await getFavourites(NoParams());

    response
        .fold((failure) => emit(HomeErrorState(msg: mapFailureToMsg(failure))),
            (products) {
      favouriteItems = products;
      emit(HomeGetFavoriteItemsLoadedState());
    });
  }

  bool isInFavorite(int id) {
    return favouriteItems
        .any((element) => element.favouriteProductEntity.id == id);
  }
}
