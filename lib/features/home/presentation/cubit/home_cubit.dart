import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/auth/domain/entities/user_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/change_favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/favourite_entity.dart';
import 'package:refactor/features/home/domain/entities/home_entity.dart';
import 'package:refactor/features/home/domain/usecases/change_favourite.dart';
import 'package:refactor/features/home/domain/usecases/get_category.dart';
import 'package:refactor/features/home/domain/usecases/get_favourite.dart';
import 'package:refactor/features/home/domain/usecases/get_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHome getHome;
  final GetCategory getCategory;
  final GetFavourite getFavourite;
  final ChangeFavourite changeFavourite;

  HomeCubit({
    required this.getHome,
    required this.getCategory,
    required this.getFavourite,
    required this.changeFavourite,
  }) : super(HomeInitial());

  int currentIndex = 0;

  void changeBottom(int index) {
    emit(HomeInitial());
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  Map<int, bool> isFavorite = {};

  List<Product> products = [];
  List<Banner> banners = [];

  Future<void> getProductData() async {
    //emit(ProductIsLoading());
    emit(HomeIsLoading());
    Either<Failure, HomeEntity> response = await getHome(NoParams());

    response
        .fold((failure) => emit(ProductError(msg: mapFailureToMsg(failure))),
            (homeEntity) {
      for (var element in homeEntity.data.products) {
        isFavorite.addAll({
          element.id: element.inFavorites,
        });
      }

      products = homeEntity.data.products;
      banners = homeEntity.data.banners;
      emit(ProductLoaded(homeEntity: homeEntity));
    });
  }

  List<Category> categories = [];

  Future<void> getCategoryData() async {
    // emit(CategoryIsLoading());
    emit(HomeIsLoading());
    Either<Failure, CategoryEntity> response = await getCategory(NoParams());

    response
        .fold((failure) => emit(CategoryError(msg: mapFailureToMsg(failure))),
            (categoryEntity) {
      categories = categoryEntity.data.data;
      emit(CategoryLoaded(categoryEntity: categoryEntity));
    });
  }

  Future<void> getHomeData() async {
    await getProductData();
    await getCategoryData();
    emit(HomeLoaded());
  }

  List<Favourite> favourites = [];
  Future<void> getFavouriteData() async {
    // emit(FavouriteIsLoading());
    emit(HomeIsLoading());
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
      emit(HomeLoaded());
    });
  }
}
