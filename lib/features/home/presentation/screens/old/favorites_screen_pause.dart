import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/home/presentation/widgets/favourites_screen_content.dart';

class FavoritesScreenPause extends StatefulWidget {
  const FavoritesScreenPause({super.key});

  @override
  State<FavoritesScreenPause> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreenPause> {
  _getFavoriteData() => BlocProvider.of<HomeCubit>(context).getFavouriteData();

  // @override
  // void initState() {
  //   super.initState();
  //   _getFavoriteData();
  // }

  Widget _buildBodyContent() {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is FavouriteIsLoading) {
          return const Center(
            child: SpinKitFadingCircle(
              color: AppColors.hint,
            ),
          );
        } else if (state is FavouriteError) {
          return ErrorScreen(onPress: () => _getFavoriteData());
        }
        // else if (state is FavouriteLoaded) {
        //   return ListView.separated(
        //       itemBuilder: (context, index) =>
        //           FavouriteScreenContent(index: index),
        //       separatorBuilder: (context, index) => const Divider(),
        //       itemCount: cubit.favourites.length);
        // }
        else {
          return ListView.separated(
              itemBuilder: (context, index) =>
                  FavouriteScreenContent(index: index),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cubit.favourites.length);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.hint,
      onRefresh: () => _getFavoriteData(),
      child: _buildBodyContent(),
    );
  }
}
