import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/usecases/change_favourite.dart';
import 'package:refactor/features/home/domain/usecases/get_banners.dart';
import 'package:refactor/features/home/domain/usecases/get_categories.dart';
import 'package:refactor/features/home/domain/usecases/get_favourite.dart';
import 'package:refactor/features/home/domain/usecases/get_products.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetBanners getBanners;
  final GetProducts getProducts;
  final GetCategories getCategories;
  final GetFavourite getFavourite;
  final ChangeFavourite changeFavourite;

  HomeCubit({
    required this.getBanners,
    required this.getProducts,
    required this.getCategories,
    required this.getFavourite,
    required this.changeFavourite,
  }) : super(HomeInitialState());

  int currentIndex = 0;

  void changeBottom(int index) {
    emit(HomeInitialState());
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  Map<int, bool> isFavorite = {};

  List<ProductEntity> products = [];

  Future<void> getProductsList() async {
    emit(HomeIsLoadingState());
    final response = await getProducts(NoParams());

    response
        .fold((failure) => emit(HomeErrorState(msg: mapFailureToMsg(failure))),
            (products) {
      for (var element in products) {
        isFavorite.addAll({
          element.id: element.inFavorites,
        });
      }

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

  List<Favourite> favourites = [];
  Future<void> getFavouriteData() async {
    // emit(FavouriteIsLoading());
    emit(HomeIsLoadingState());
    Either<Failure, FavouriteEntity> response = await getFavourite(NoParams());
    response
        .fold((failure) => emit(FavouriteError(msg: mapFailureToMsg(failure))),
            (favouriteEntity) {
      favourites = favouriteEntity.data.data;
      emit(FavouriteLoaded(favouriteEntity: favouriteEntity));
    });
  }

  Future<void> changeFavouriteData({required int productId}) async {
    isFavorite[productId] = !(isFavorite[productId]!);
    emit(ChangeFavouriteState());
    Either<Failure, ChangeFavouriteEntity> response =
        await changeFavourite(ChangeFavouriteParams(productId: productId));
    response.fold((failure) {
      isFavorite[productId] = !isFavorite[productId]!;
      emit(ChangeFavouriteError(msg: mapFailureToMsg(failure)));
    }, (changeFavouriteEntity) {
      if (!changeFavouriteEntity.status) {
        isFavorite[productId] = !isFavorite[productId]!;
      } else {
        getFavouriteData();
      }

      emit(ChangeFavouriteLoaded(changefavouriteEntity: changeFavouriteEntity));
      emit(HomeLoadedState());
    });
  }
}
