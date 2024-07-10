import 'package:flutter/material.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

// ignore: must_be_immutable
class RowSlideContent extends StatelessWidget {
  String title;
  List<String> images;
  RowSlideContent({super.key, required this.images, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: mega.white.semiBold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 20, right: 8),
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var image = images[index];
                  return ImageCustom(
                    margin: EdgeInsets.only(right: 12),
                    height: 200,
                    width: 150,
                    fit: BoxFit.cover,
                    image: AssetImage(image),
                    borderRadius: BorderRadius.circular(12),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
