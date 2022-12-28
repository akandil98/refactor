import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/widgets/categories_screen_content.dart';

class CategoriesScreen extends HookWidget {
  const CategoriesScreen({super.key});

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
      } else if (state is CategoryError) {
        return ErrorScreen(
            onPress: () => context.read<HomeCubit>().getCategoryData());
      } else if (context.read<HomeCubit>().categories.isEmpty) {
        return ErrorScreen(
            onPress: () => context.read<HomeCubit>().getCategoryData());
      } else {
        return ListView.separated(
            itemBuilder: (context, index) =>
                CategoriesScreenContent(index: index),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: context.read<HomeCubit>().categories.length);
      }
    });
  }
}
