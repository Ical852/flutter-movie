import 'package:flutter/material.dart';
import 'package:movlix/screens/detail_pages/widgets/genre_badge.dart';
import 'package:movlix/screens/detail_pages/widgets/line.dart';
import 'package:movlix/shared/text_styles.dart';

class Synopsis extends StatelessWidget {
  const Synopsis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Line(),
          SizedBox(height: 16,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Release Date",
                    style: base.white.semiBold,
                  ),
                  SizedBox(height: 12,),
                  Text(
                    "December 9, 2017",
                    style: regular.grey.regularF,
                  )
                ],
              ),
              SizedBox(width: 50,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Genre",
                      style: base.white.semiBold,
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        GenreBadge(),
                        SizedBox(width: 12,),
                        GenreBadge(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          Line(),
          SizedBox(height: 12,),
          Text(
            "Sinopsis",
            style: mega.white.semiBold,
          ),
          SizedBox(height: 10,),
          Text(
            "The Asgardian Loki encounters the Other, the leader of an extraterrestrial race known as the Chitauri. In exchange for retrieving the Tesseract...",
            style: regular.grey.regularF,
            maxLines: 5,
          )
        ],
      ),
    );
  }
}