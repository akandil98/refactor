import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryWidget({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 80.0.w,
                height: 80.0.h,
                child: Image(
                  image: NetworkImage(categoryEntity.image),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20.0.w,
              ),
              Text(
                categoryEntity.name,
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
