import 'package:flutter/material.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/buttons/mini_button_custom.dart';
import 'package:movlix/widgets/image_custom.dart';

class BackdropContent extends StatelessWidget {
  const BackdropContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          bottom: 20
        ),
        height: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageCustom(
              margin: EdgeInsets.only(
                top: 32,
                left: 28
              ),
              height: 28, 
              width: 16,
              image: AssetImage(getIC("ic_back.png")),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Justice Leage Zack Snyder",
                            style: mega.white.semiBold,
                            maxLines: 2,
                          ),
                          SizedBox(height: 2,),
                          Text(
                            "1 hour 39 minute(s)",
                            style: regular.white.regularF,
                          ),
                          Row(
                            children: [
                              ImageCustom(height: 16, width: 16, image: AssetImage(getIC("ic_star.png")),),
                              SizedBox(width: 4,),
                              Text(
                                "8.9 / 10 from IMDb",
                                style: regular.grey.regularF,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              ImageCustom(height: 16, width: 16, image: AssetImage(getIC("ic_thumb.png")),),
                              SizedBox(width: 4,),
                              Text(
                                "98% from users",
                                style: regular.grey.regularF,
                              )
                            ],
                          ),
                          SizedBox(height: 3,),
                          MiniButtonCustom(
                            width: 160,
                            height: 30,
                            title: "Watch Now", onPressed: (){}
                          )
                        ],
                      ),
                    )
                  ),
                  Container(
                    child: ImageCustom(
                      height: 170,
                      width: (getWH(context, "width") / 2) - 47.5,
                      image: AssetImage(dummyImg),
                      fit: BoxFit.cover,
                      margin: EdgeInsets.only(
                        right: 20,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      );
  }
}