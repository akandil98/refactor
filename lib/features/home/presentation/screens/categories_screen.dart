import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/widgets/categories_screen_content.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  _getCategoryData() => BlocProvider.of<HomeCubit>(context).getCategoryData();

  // @override
  // void initState() {
  //   super.initState();
  //   _getCategoryData();
  // }

  Widget _buildBodyContent() {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is CategoryIsLoading) {
          return const Center(
            child: SpinKitFadingCircle(
              color: AppColors.hint,
            ),
          );
        } else if (state is CategoryError) {
          return ErrorScreen(onPress: () => _getCategoryData());
        }
        // else if (state is CategoryLoaded) {
        //   return ListView.separated(
        //       itemBuilder: (context, index) =>
        //           CategoriesScreenContent(index: index),
        //       separatorBuilder: (context, index) => const Divider(),
        //       itemCount: cubit.categories.length);
        // }
        else {
          return ListView.separated(
              itemBuilder: (context, index) =>
                  CategoriesScreenContent(index: index),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cubit.categories.length);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.hint,
      onRefresh: () => _getCategoryData(),
      child: _buildBodyContent(),
    );
  }
}
