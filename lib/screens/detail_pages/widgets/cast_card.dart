import 'package:flutter/material.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCustom(height: 72, width: 72, borderRadius: BorderRadius.circular(4),
          fit: BoxFit.cover,
          image: AssetImage(dummyImg),),
          SizedBox(height: 8,),
          Text(
            "Tom Holland",
            style: small.white.regularF,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}