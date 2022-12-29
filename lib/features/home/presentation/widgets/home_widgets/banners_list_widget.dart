import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/features/home/domain/entities/banner_entity.dart';

class BannersListWidget extends StatelessWidget {
  final List<BannerEntity> banners;
  const BannersListWidget({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners
          .map((item) => Image(
                image: NetworkImage(item.image),
                width: double.infinity,
                fit: BoxFit.cover,
              ))
          .toList(),
      options: CarouselOptions(
        height: 200.0.h,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
