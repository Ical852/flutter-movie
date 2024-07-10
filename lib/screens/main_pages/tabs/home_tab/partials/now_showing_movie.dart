import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/widgets/now_showing_card.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/shared/text_styles.dart';

class NowShowing extends StatelessWidget {
  const NowShowing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Now Showing",
            style: mega.white.semiBold,
          ),
          SizedBox(
            height: 22,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              double deviceWidth = constraints.maxWidth;
              double aspectRatio = 177 / 242;
              double itemHeight = deviceWidth * aspectRatio;
              double enlargedHeight = itemHeight * 1.2;

              return CarouselSlider.builder(
                itemCount: dummyList.length,
                itemBuilder: (context, index, realIndex) {
                  return NowShowingCard(deviceWidth: deviceWidth, itemHeight: itemHeight, image: dummyList[index]);
                },
                options: CarouselOptions(
                  height: enlargedHeight,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.63,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
