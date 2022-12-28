import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/widgets/favourites_screen_content.dart';

class FavouritesScreen extends HookWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBodyContent();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeIsLoading) {
        return const Center(
          child: SpinKitFadingCircle(
            color: AppColors.hint,
          ),
        );
      } else if (state is FavouriteError) {
        return ErrorScreen(
            onPress: () => context.read<HomeCubit>().getFavouriteData());
      } else if (context.read<HomeCubit>().favourites.isEmpty) {
        return ErrorScreen(
            onPress: () => context.read<HomeCubit>().getFavouriteData());
      } else {
        return (context.read<HomeCubit>().favourites.isEmpty)
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.list,
                      size: 40,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text(AppStrings.favouriteIsEmpty),
                  ],
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) =>
                    FavouriteScreenContent(index: index),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: context.read<HomeCubit>().favourites.length);
      }
    });
  }
}
