import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/widgets/coming_soon_card.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/shared/text_styles.dart';

class ComingSoonMovie extends StatelessWidget {
  const ComingSoonMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Coming Soon",
            style: mega.white.semiBold,
          ),
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              viewportFraction: 1,
            ),
            items: dummyList
                .map((image) => ComingSoonCard(
                      title: "Justice League",
                      image: image,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
