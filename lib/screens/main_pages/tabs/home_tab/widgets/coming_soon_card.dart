import 'package:flutter/material.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

// ignore: must_be_immutable
class ComingSoonCard extends StatelessWidget {
  String image, title;
  ComingSoonCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ImageCustom(
        fit: BoxFit.cover,
        width: getWH(context, "width") - 40,
        height: 200,
        image: AssetImage(image),
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Container(
              width: getWH(context, "width") - 40,
              height: 45,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff000000).withOpacity(0.95),
                    Color(0xff000000).withOpacity(0.65),
                    Color(0xff000000).withOpacity(0.45),
                    Color(0xff000000).withOpacity(0.25),
                    whiteColor.withOpacity(0),
                  ])),
            ),
            Container(
              margin: EdgeInsets.only(left: 18, top: 12),
              child: Text(
                "Justice League",
                style: regular.white.semiBold,
              ),
            ),
            Center(
              child: ImageCustom(
                width: 34,
                height: 34,
                image: AssetImage(getIC("ic_play_btn.png")),
              ),
            )
          ],
        ),
      )),
    );
  }
}
