import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/coming_soon_movie_cubit.dart';
import 'package:movlix/blocs/cubits/now_playing_movie_cubit.dart';
import 'package:movlix/blocs/cubits/page_cubit.dart';
import 'package:movlix/blocs/cubits/popular_movie_cubit.dart';
import 'package:movlix/blocs/cubits/top_rated_movie_cubit.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/coming_soon_movie.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/header_user.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/now_showing_movie.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/search_box.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/top_rated_movie.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/view_models/main/home_view_model.dart';
import 'package:movlix/widgets/row_slide_content.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late HomeViewModel homeVM = HomeViewModel(context);

  @override
  void initState() {
    super.initState();
    homeVM.getTopRated();
    homeVM.getPopular();
    homeVM.getComingSoon();
    homeVM.getNowPlaying();
  }

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
          GestureDetector(
              onTap: () => context.read<PageCubit>().setNewPage("explore"),
              child: SearchBox()),
          SizedBox(
            height: 24,
          ),

          BlocConsumer<TopRatedMovieCubit, TopRatedMovieState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is TopRatedMovieLoading) {
                return Container(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: whiteColor,
                      ),
                    ));
              }
              if (state is TopRatedMovieSuccess) {
                return TopRatedMovie(
                  state: state.topRated,
                );
              }
              return Container();
            },
          ),

          SizedBox(
            height: 20,
          ),
          BlocConsumer<PopularMovieCubit, PopularMovieState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PopularMovieLoading) {
                return Container(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: whiteColor,
                      ),
                    ));
              }
              if (state is PopularMovieSuccess) {
                return RowSlideContent(
                  title: "Most Popular",
                  state: state.popular,
                );
              }
              return Container();
            },
          ),

          SizedBox(
            height: 20,
          ),
          BlocConsumer<ComingSoonMovieCubit, ComingSoonMovieState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ComingSoonMovieLoading) {
                return Container(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: whiteColor,
                      ),
                    ));
              }
              if (state is ComingSoonMovieSuccess) {
                return ComingSoonMovie(
                  title: "Coming Soon",
                  state: state.comingSoon,
                );
              }
              return Container();
            },
          ),

          SizedBox(
            height: 32,
          ),
          BlocConsumer<NowPlayingMovieCubit, NowPlayingMovieState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is NowPlayingMovieLoading) {
                return Container(
                    height: 200,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: whiteColor,
                      ),
                    ));
              }
              if (state is NowPlayingMovieSuccess) {
                return NowShowing(
                  title: "Now Playing Movie",
                  state: state.nowPlaying,
                );
              }
              return Container();
            },
          ),
          SizedBox(
            height: 32,
          ),

          // RowSlideContent(
          //   title: "Trending Movie This Week",
          //   images: dummyList,
          // ),
          SizedBox(
            height: 20,
          ),

          // RowSlideContent(
          //   title: "Trending Tv This Week",
          //   images: dummyList,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // ComingSoonMovie(title: "Popular Tv Series",),
          // SizedBox(
          //   height: 20,
          // ),

          // RowSlideContent(
          //   title: "Trending Movie Today",
          //   images: dummyList,
          // ),
          SizedBox(
            height: 20,
          ),

          // RowSlideContent(
          //   title: "Trending Tv Today",
          //   images: dummyList,
          // ),
          // SizedBox(
          //   height: 32,
          // ),
          // NowShowing(title: "Top Rated Tv Series",),
          // SizedBox(
          //   height: 32,
          // ),

          // RowSlideContent(
          //   title: "All Movie Tv Trending Today",
          //   images: dummyList,
          // ),
          SizedBox(
            height: 172,
          ),
        ],
      ),
    );
  }
}
