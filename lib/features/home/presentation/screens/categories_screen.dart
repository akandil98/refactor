import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/widgets/categories_widgets/categories_list_widget.dart';

class CategoriesScreen extends HookWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBodyContent();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final cubit = context.read<HomeCubit>();
      if (state is HomeIsLoadingState) {
        return const Center(
          child: SpinKitFadingCircle(
            color: AppColors.hint,
          ),
        );
      } else if (state is HomeErrorState || cubit.categories.isEmpty) {
        return ErrorScreen(onPress: () => cubit.getCategoriesList());
      } else {
        return CategoriesListWidget(
          categories: cubit.categories,
        );
      }
    });
  }
}
