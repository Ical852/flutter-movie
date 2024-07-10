import 'package:flutter/material.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/shared/text_styles.dart';

class GenreBadge extends StatelessWidget {
  const GenreBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4
      ),
      decoration: BoxDecoration(
        color: greyColor2,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: greyColor
        )
      ),
      child: Text(
        "Action",
        style: small.white.light,
      ),
    );
  }
}