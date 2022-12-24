import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/features/home/domain/usecases/get_home.dart';
import 'package:refactor/features/home/presentation/screens/categories_screen.dart';
import 'package:refactor/features/home/presentation/screens/favorites_screen.dart';
import 'package:refactor/features/home/presentation/screens/home_screen.dart';
import 'package:refactor/features/home/presentation/screens/settings_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHome getHome;
  HomeCubit({required this.getHome}) : super(HomeInitial());

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void changeBottom(int index) {
    emit(HomeInitial());
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
