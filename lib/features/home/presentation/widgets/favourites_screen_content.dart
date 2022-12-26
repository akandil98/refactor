import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';

class FavouriteScreenContent extends StatelessWidget {
  final int index;
  bool isOldPrice;
  bool isFavourite;
  FavouriteScreenContent({
    super.key,
    required this.index,
    this.isOldPrice = true,
    this.isFavourite = true,
  });

  @override
  Widget build(BuildContext context) {
    final cubit =
        context.read<HomeCubit>().favourites[index].favouriteProductItem;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120.0.h,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(cubit.image),

                  width: 120.0.w,
                  height: 120.0.h,
                  // fit: BoxFit.cover,
                ),
                if (cubit.discount != 0 && isOldPrice)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      AppStrings.discount,
                      style: TextStyle(
                        fontSize: 8.0.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20.0.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.name,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      height: 1.3.h,
                    ),
                  ),
                  //const Spacer(),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${cubit.price.round()} ${AppStrings.egp}',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 5.0.w,
                          ),
                          if (cubit.discount != 0 && isOldPrice)
                            Text(
                              '${cubit.oldPrice.round()} ${AppStrings.egp}',
                              style: TextStyle(
                                fontSize: 10.0.sp,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      if (isFavourite)
                        IconButton(
                          onPressed: () {
                            context
                                .read<HomeCubit>()
                                .changeFavouriteData(productId: cubit.id);
                          },
                          icon: CircleAvatar(
                            radius: 15.0,
                            backgroundColor: (context
                                        .read<HomeCubit>()
                                        .isFavorite[cubit.id] !=
                                    null)
                                ? Colors.blue
                                : Colors.grey,
                            child: const Icon(
                              Icons.favorite_border,
                              size: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
