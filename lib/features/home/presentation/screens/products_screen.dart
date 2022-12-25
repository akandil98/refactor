import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/widgets/products_screen_content.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  _getHomeData() => BlocProvider.of<HomeCubit>(context).getHomeData();

  @override
  void initState() {
    super.initState();
    _getHomeData();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeIsLoading) {
          return const Center(
            child: SpinKitFadingCircle(
              color: AppColors.hint,
            ),
          );
        } else if (state is HomeError) {
          return ErrorScreen(onPress: () => _getHomeData());
        } else if (state is HomeLoaded) {
          return const ProductsScreenContent();
        } else {
          return const Center(
            child: SpinKitFadingCircle(
              color: AppColors.hint,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.hint,
      onRefresh: () => _getHomeData(),
      child: _buildBodyContent(),
    );
  }
}
