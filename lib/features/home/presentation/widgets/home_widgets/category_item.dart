import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  const CategoryItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 100.0.h,
          width: 100.0.w,
          child: Image(
            image: NetworkImage(cubit.categories[index].image),
            fit: BoxFit.cover,
          ),
        ),
        Container(
            color: Colors.black.withOpacity(0.8),
            width: 100.0.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                cubit.categories[index].name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            )),
      ],
    );
  }
}
