import 'package:flutter/material.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/presentation/widgets/categories_widgets/category_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  final List<CategoryEntity> categories;
  const CategoriesListWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => CategoryWidget(
              categoryEntity: categories[index],
            ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: categories.length);
  }
}
