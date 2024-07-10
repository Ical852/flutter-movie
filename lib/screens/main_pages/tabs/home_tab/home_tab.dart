import 'package:flutter/material.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/coming_soon_movie.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/header_user.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/most_popular_movie.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/now_showing_movie.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/search_box.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/top_rated_movie.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SizedBox(
            height: 24,
          ),
          HeaderUser(),
          SizedBox(
            height: 16,
          ),
          SearchBox(),
          SizedBox(
            height: 24,
          ),
          TopRatedMovie(),
          SizedBox(
            height: 20,
          ),
          MostPopularMovie(),
          SizedBox(
            height: 20,
          ),
          ComingSoonMovie(),
          SizedBox(
            height: 32,
          ),
          NowShowing(),
          SizedBox(
            height: 172,
          ),
        ],
      ),
    );
  }
}
