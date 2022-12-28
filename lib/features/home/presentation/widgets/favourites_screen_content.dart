import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';

class FavouriteScreenContent extends StatelessWidget {
  final int index;

  const FavouriteScreenContent({
    super.key,
    required this.index,
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
                SizedBox(
                  width: 120.0.w,
                  height: 120.0.h,
                  child: Image(
                    image: NetworkImage(cubit.image),

                    // fit: BoxFit.cover,
                  ),
                ),
                if (cubit.discount != 0)
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          if (cubit.discount != 0)
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
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeCubit>()
                              .changeFavouriteData(productId: cubit.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                              (context.read<HomeCubit>().isFavorite[cubit.id] !=
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
