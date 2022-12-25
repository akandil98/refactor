import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/error/failures.dart';
import 'package:refactor/core/usecases/usecase.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/domain/usecases/get_category.dart';
import 'package:refactor/features/home/domain/usecases/get_product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProduct getProduct;
  final GetCategory getCategory;
  HomeCubit({
    required this.getProduct,
    required this.getCategory,
  }) : super(HomeInitial());

  int currentIndex = 0;

  void changeBottom(int index) {
    emit(HomeInitial());
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  Map<int, bool>? favorites = {};

  List<Product> products = [];
  List<Banner> banners = [];

  Future<void> getProductData() async {
    emit(ProductIsLoading());
    Either<Failure, ProductEntity> response = await getProduct(NoParams());

    response.fold((failure) => emit(HomeError(msg: mapFailureToMsg(failure))),
        (productEntity) {
      for (var element in productEntity.data.products) {
        favorites?.addAll({
          element.id: element.inFavorites,
        });
      }

      products = productEntity.data.products;
      banners = productEntity.data.banners;
      emit(ProductLoadedSuccess(productEntity: productEntity));
    });
  }

  List<Category> categories = [];

  Future<void> getCategoryData() async {
    emit(CategoryIsLoading());
    Either<Failure, CategoryEntity> response = await getCategory(NoParams());

    response.fold((failure) => emit(HomeError(msg: mapFailureToMsg(failure))),
        (categoryEntity) {
      categories = categoryEntity.data.data;
      emit(CategoryLoadedSuccess(categoryEntity: categoryEntity));
    });
  }

  Future<void> getHomeData() async {
    emit(HomeIsLoading());
    await getProductData();
    await getCategoryData();
    emit(HomeLoaded(
        // productEntity: pr,
        // categoryEntity: ce,
        ));
  }
}
