import 'package:flutter/material.dart';
import 'package:movlix/screens/detail_pages/widgets/cast_card.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/shared/text_styles.dart';

class Cast extends StatelessWidget {
  const Cast({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Cast",
              style: mega.white.semiBold,
            ),
          ),
          SizedBox(height: 16,),
          Container(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20, right: 8),
              scrollDirection: Axis.horizontal,
              itemCount: dummyList.length,
              itemBuilder: (context, index) {
                return CastCard();
              },
            ),
          )
        ],
      ),
    );
  }
}