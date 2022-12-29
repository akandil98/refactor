import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';
import 'package:refactor/features/home/domain/entities/category_entity.dart';
import 'package:refactor/features/home/domain/entities/product_entity.dart';
import 'package:refactor/features/home/presentation/widgets/home_widgets/banners_list_widget.dart';
import 'package:refactor/features/home/presentation/widgets/home_widgets/category_widget.dart';
import 'package:refactor/features/home/presentation/widgets/home_widgets/product_widget.dart';

class HomeScreenContent extends StatelessWidget {
  final List<BannerEntity> banners;
  final List<CategoryEntity> categories;
  final List<ProductEntity> products;
  const HomeScreenContent({
    super.key,
    required this.banners,
    required this.categories,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannersListWidget(banners: banners),
            SizedBox(
              height: 10.0.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppStrings.categories,
                        style: TextStyle(
                          fontSize: 24.0.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  SizedBox(
                    height: 100.0.h,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryWidget(
                        categoryEntity: categories[index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.0.w,
                      ),
                      itemCount: categories.length,
                    ),
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppStrings.newProducts,
                        style: TextStyle(
                          fontSize: 24.0.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.57,
                children: List.generate(
                  products.length,
                  (index) => ProductWidget(
                    productEntity: products[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
