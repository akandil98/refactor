import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';

class CategoriesScreenContent extends StatelessWidget {
  final int index;
  const CategoriesScreenContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: NetworkImage(cubit.categories[index].image),
                width: 80.0.w,
                height: 80.0.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 20.0.w,
              ),
              Text(
                cubit.categories[index].name,
                style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
