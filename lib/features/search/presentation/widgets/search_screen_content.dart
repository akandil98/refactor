import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/search/presentation/cubit/search_cubit.dart';

class SearchScreenContent extends StatelessWidget {
  final int index;
  bool isOldPrice;
  SearchScreenContent({
    super.key,
    required this.index,
    this.isOldPrice = false,
  });
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>().searchResult[index];
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
                if (isOldPrice)
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
                          if (isOldPrice)
                            Text(
                              AppStrings.egp,
                              style: TextStyle(
                                fontSize: 10.0.sp,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     //TODO fix error null check operator used on a null value
                      //     // context
                      //     //     .read<HomeCubit>()
                      //     //     .changeFavouriteData(productId: productId);
                      //   },
                      //   icon: CircleAvatar(
                      //     radius: 15.0,
                      //     backgroundColor:
                      //         cubit.inFavorites ? Colors.blue : Colors.grey,
                      //     child: const Icon(
                      //       Icons.favorite_border,
                      //       size: 18.0,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
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
