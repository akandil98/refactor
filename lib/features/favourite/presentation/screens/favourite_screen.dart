import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/favourite/presentation/widgets/favourite_item_widget.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';

class FavouritesScreen extends HookWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBodyContent();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeIsLoadingState) {
        return const Center(
          child: SpinKitFadingCircle(
            color: AppColors.hint,
          ),
        );
      } else if (state is HomeErrorState) {
        return ErrorScreen(
            onPress: () => context.read<HomeCubit>().getFavouriteItems());
      } else {
        return (context.read<HomeCubit>().favouriteItems.isEmpty)
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
                itemBuilder: (context, index) => FavouriteItemWidget(
                      favouriteProductEntity: context
                          .read<HomeCubit>()
                          .favouriteItems[index]
                          .favouriteProductEntity,
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: context.read<HomeCubit>().favouriteItems.length);
      }
    });
  }
}
