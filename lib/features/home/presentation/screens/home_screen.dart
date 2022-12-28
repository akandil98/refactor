import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/widgets/home_widgets/home_screen_content.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

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
      } else if (state is HomeError) {
        return ErrorScreen(
            onPress: () => context.read<HomeCubit>().getHomeData());
      } else if (context.read<HomeCubit>().categories.isEmpty &&
          context.read<HomeCubit>().products.isEmpty) {
        return ErrorScreen(
            onPress: () => context.read<HomeCubit>().getHomeData());
      } else {
        return const HomeScreenContent();
      }
    });
  }
}
