import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/search/presentation/cubit/search_cubit.dart';

class SearchScreenContent extends StatelessWidget {
  final int index;
  const SearchScreenContent({
    super.key,
    required this.index,
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
                SizedBox(
                  width: 120.0.w,
                  height: 120.0.h,
                  child: Image(
                    image: NetworkImage(cubit.image),
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
                        ],
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
