import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 150.0.h,
                  child: Image(
                    image: NetworkImage(productEntity.image),
                  ),
                ),
              ),
              if (productEntity.discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(5.0),
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
          Container(
            height: 85.h,
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productEntity.name,
                  maxLines: 2,
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
                          '${productEntity.price.round()} ${AppStrings.egp}',
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        if (productEntity.discount != 0)
                          Text(
                            '${productEntity.oldPrice.round()} ${AppStrings.egp}',
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
                        cubit.changeFavouriteFun(productId: productEntity.id);
                      },
                      icon: CircleAvatar(
                        radius: 15.0.r,
                        backgroundColor: cubit.favouriteMap[productEntity.id]!
                            ? Colors.blue
                            : Colors.grey,
                        child: const Icon(
                          Icons.favorite_border,
                          size: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
