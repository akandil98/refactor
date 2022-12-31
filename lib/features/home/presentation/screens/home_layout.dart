import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refactor/config/routes/app_routes.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/core/utils/constants.dart';
import 'package:refactor/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/screens/categories_screen.dart';
import 'package:refactor/features/home/presentation/screens/home_screen.dart';
import 'package:refactor/features/settings/presentation/screens/settings_screen.dart';
import 'package:refactor/injection.container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = di.sl<SharedPreferences>();
    final List<Widget> bottomScreens = [
      const HomeScreen(),
      const CategoriesScreen(),
      const FavouritesScreen(),
      const SettingsScreen(),
    ];
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
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
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.searchRoute);
                  },
                  icon: const Icon(
                    Icons.search,
                  )),
              IconButton(
                onPressed: () {
                  sharedPreferences.remove(AppStrings.token);
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) => previous is HomeInitialState,
            builder: (context, state) {
              return bottomScreens[context.read<HomeCubit>().currentIndex];
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                context.read<HomeCubit>().changeBottom(index);
              },
              currentIndex: context.read<HomeCubit>().currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: AppStrings.home,
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
