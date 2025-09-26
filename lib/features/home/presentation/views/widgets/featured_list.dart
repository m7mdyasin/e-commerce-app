import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return FeaturedItem();
      },
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 6),
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.9,
        autoPlayAnimationDuration: Duration(milliseconds: 1100),
      ),
    );
  }
}
