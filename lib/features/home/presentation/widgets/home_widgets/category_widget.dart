import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryWidget({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 100.0.h,
          width: 100.0.w,
          child: Image(
            image: NetworkImage(categoryEntity.image),
            fit: BoxFit.cover,
          ),
        ),
        Container(
            color: Colors.black.withOpacity(0.8),
            width: 100.0.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                categoryEntity.name,
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
