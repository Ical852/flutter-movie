import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

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
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: AspectRatio(
                      aspectRatio: 177 / 242,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ImageCustom(
                          fit: BoxFit.cover,
                          height: itemHeight,
                          width: deviceWidth * 0.7,
                          image: AssetImage(dummyList[index]),
                        ),
                      ),
                    ),
                  );
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
