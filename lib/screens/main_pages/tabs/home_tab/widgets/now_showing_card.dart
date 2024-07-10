import 'package:flutter/material.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/widgets/now_showing_badge.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

// ignore: must_be_immutable
class NowShowingCard extends StatelessWidget {
  double itemHeight, deviceWidth;
  String image;
  NowShowingCard({
    super.key,
    required this.deviceWidth,
    required this.itemHeight,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
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
            image: AssetImage(image),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          whiteColor.withOpacity(0),
                          Color(0xff000000).withOpacity(0.25),
                          Color(0xff000000).withOpacity(0.45),
                          Color(0xff000000).withOpacity(0.65),
                          Color(0xff000000).withOpacity(0.95),
                        ]
                      )
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Justice League",
                        style: base.white.semiBold,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          NowShowingBadge(),
                          SizedBox(
                            width: 10,
                          ),
                          NowShowingBadge(),
                          SizedBox(
                            width: 10,
                          ),
                          NowShowingBadge(),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
