import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/core/utils/constants.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/screens/categories_screen.dart';
import 'package:refactor/features/home/presentation/screens/favorites_screen.dart';
import 'package:refactor/features/home/presentation/screens/products_screen.dart';
import 'package:refactor/features/home/presentation/screens/settings_screen.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomScreens = [
      const ProductsScreen(),
      const CategoriesScreen(),
      const FavoritesScreen(),
      const SettingsScreen(),
    ];
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) {
          Constants.showToast(msg: AppStrings.welcome);
        }
        if (state is HomeError) {
          Constants.showErrorDialog(context: context, msg: state.msg);
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            title: const Text(AppStrings.appName),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  )),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: bottomScreens[context.read<HomeCubit>().currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                context.read<HomeCubit>().changeBottom(index);
              },
              currentIndex: context.read<HomeCubit>().currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: AppStrings.products,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: AppStrings.categories,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: AppStrings.favourite,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppStrings.settings,
                ),
              ]),
        );
      },
    );
  }
}
