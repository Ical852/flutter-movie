import 'package:flutter/material.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

class HeaderUser extends StatelessWidget {
  const HeaderUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, User",
                style: extra.white.semiBold,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Welcome to movlix, enjoy!",
                style: regular.grey.mediumF,
              )
            ],
          ),
          Spacer(),
          ImageCustom(
            height: 54,
            width: 54,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(50),
            image: AssetImage(getIM("im_user.png")),
          )
        ],
      ),
    );
  }
}
