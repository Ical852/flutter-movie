import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/widgets/coming_soon_card.dart';
import 'package:movlix/shared/text_styles.dart';

// ignore: must_be_immutable
class ComingSoonMovie extends StatelessWidget {
  String title;
  FetchResponse state;
  ComingSoonMovie({super.key, required this.title, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: mega.white.semiBold,
          ),
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              viewportFraction: 1,
            ),
            items: state.results!.map((detail) => ComingSoonCard(
              detail: detail,
            )).toList(),
          ),
        ],
      ),
    );
  }
}
