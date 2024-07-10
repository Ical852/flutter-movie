import 'package:flutter/material.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/widgets/row_slide_content.dart';

class MostPopularMovie extends StatelessWidget {
  const MostPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RowSlideContent(
        title: "Most Popular",
        images: dummyList,
      ),
    );
  }
}
