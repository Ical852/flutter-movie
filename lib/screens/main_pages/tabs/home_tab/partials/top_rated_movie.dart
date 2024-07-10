import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/widgets/image_custom.dart';

class TopRatedMovie extends StatelessWidget {
  const TopRatedMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage:
              false, // Set to false to avoid enlarging center item
          enableInfiniteScroll: true,
          viewportFraction:
              0.83, // Set this value to see a part of next/previous item
        ),
        items: dummyList
            .map((image) => Container(
                  child: Center(
                      child: ImageCustom(
                    fit: BoxFit.cover,
                    width: getWH(context, "width") - 84,
                    height: 220,
                    image: AssetImage(image),
                    borderRadius: BorderRadius.circular(12),
                  )),
                ))
            .toList(),
      ),
    );
  }
}
