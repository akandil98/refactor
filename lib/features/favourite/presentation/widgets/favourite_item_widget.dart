import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/favourite/domain/entities/favourite_product_entity.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';

class FavouriteItemWidget extends StatelessWidget {
  final FavouriteProductEntity favouriteProductEntity;

  const FavouriteItemWidget({
    super.key,
    required this.favouriteProductEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120.0.h,
        width: double.infinity,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                  width: 120.0.w,
                  height: 120.0.h,
                  child: Image(
                    image: NetworkImage(favouriteProductEntity.image),
                  ),
                ),
                if (favouriteProductEntity.discount != 0)
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
                    favouriteProductEntity.name,
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
                            '${favouriteProductEntity.price.round()} ${AppStrings.egp}',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 5.0.w,
                          ),
                          if (favouriteProductEntity.discount != 0)
                            Text(
                              '${favouriteProductEntity.oldPrice.round()} ${AppStrings.egp}',
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
                          // context
                          //     .read<HomeCubit>()
                          //     .changeFavouriteData(productId: cubit.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: context
                                  .read<HomeCubit>()
                                  .isInFavorite(favouriteProductEntity.id)
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
