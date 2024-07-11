import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/all_trending_today_cubit.dart';
import 'package:movlix/blocs/cubits/coming_soon_movie_cubit.dart';
import 'package:movlix/blocs/cubits/now_playing_movie_cubit.dart';
import 'package:movlix/blocs/cubits/page_cubit.dart';
import 'package:movlix/blocs/cubits/popular_movie_cubit.dart';
import 'package:movlix/blocs/cubits/popular_tv_cubit.dart';
import 'package:movlix/blocs/cubits/top_rated_movie_cubit.dart';
import 'package:movlix/blocs/cubits/top_rated_tv_cubit.dart';
import 'package:movlix/blocs/cubits/trending_movie_today_cubit.dart';
import 'package:movlix/blocs/cubits/trending_movie_week_cubit.dart';
import 'package:movlix/blocs/cubits/trending_tv_today_cubit.dart';
import 'package:movlix/blocs/cubits/trending_tv_week_cubit.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/center_carousel.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/header_user.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/center_show_carousel.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/search_box.dart';
import 'package:movlix/screens/main_pages/tabs/home_tab/partials/top_rated_movie.dart';
import 'package:movlix/view_models/main/home_view_model.dart';
import 'package:movlix/widgets/loading_custom.dart';
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
    homeVM.getTrendingMovieWeek();
    homeVM.getTrendingTvWeek();
    homeVM.getPopularTv();
    homeVM.getTrendingMovieToday();
    homeVM.getTrendingTvToday();
    homeVM.getTopRatedTv();
    homeVM.getAllTrendingToday();
  }

  @override
  Widget build(BuildContext context) {
    Widget HeadContent() {
      return Column(
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
        ],
      );
    }

    Widget TopRatedContent() {
      return BlocConsumer<TopRatedMovieCubit, TopRatedMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopRatedMovieLoading) {
            return LoadingCustom();
          }
          if (state is TopRatedMovieSuccess) {
            return TopRatedMovie(
              state: state.topRated,
            );
          }
          return Container();
        },
      );
    }

    Widget PopularMovieContent() {
      return BlocConsumer<PopularMovieCubit, PopularMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PopularMovieLoading) {
            return LoadingCustom();
          }
          if (state is PopularMovieSuccess) {
            return RowSlideContent(
              title: "Most Popular",
              state: state.popular,
            );
          }
          return Container();
        },
      );
    }

    Widget ComingSoonMovieContent() {
      return BlocConsumer<ComingSoonMovieCubit, ComingSoonMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ComingSoonMovieLoading) {
            return LoadingCustom();
          }
          if (state is ComingSoonMovieSuccess) {
            return CenterCarousel(
              title: "Coming Soon",
              state: state.comingSoon,
            );
          }
          return Container();
        },
      );
    }

    Widget NowPlayingMovieContent() {
      return BlocConsumer<NowPlayingMovieCubit, NowPlayingMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NowPlayingMovieLoading) {
            return LoadingCustom();
          }
          if (state is NowPlayingMovieSuccess) {
            return CenterShowCarousel(
              title: "Now Playing Movie",
              state: state.nowPlaying,
            );
          }
          return Container();
        },
      );
    }

    Widget TrendingMovieWeekContent() {
      return BlocConsumer<TrendingMovieWeekCubit, TrendingMovieWeekState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TrendingMovieWeekLoading) {
            return LoadingCustom();
          }
          if (state is TrendingMovieWeekSuccess) {
            return RowSlideContent(
              title: "Trending Movie This Week",
              state: state.trendingMovieWeek,
            );
          }
          return Container();
        },
      );
    }

    Widget TrendingTvWeekContent() {
      return BlocConsumer<TrendingTvWeekCubit, TrendingTvWeekState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TrendingTvWeekLoading) {
            return LoadingCustom();
          }
          if (state is TrendingTvWeekSuccess) {
            return RowSlideContent(
              isTv: true,
              title: "Trending Tv This Week",
              state: state.trendingTvWeek,
            );
          }
          return Container();
        },
      );
    }

    Widget PopularTvContent() {
      return BlocConsumer<PopularTvCubit, PopularTvState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PopularTvLoading) {
            return LoadingCustom();
          }
          if (state is PopularTvSuccess) {
            return CenterCarousel(
              isTv: true,
              title: "Coming Soon",
              state: state.popularTv,
            );
          }
          return Container();
        },
      );
    }

    Widget TrendingMovieTodayContent() {
      return BlocConsumer<TrendingMovieTodayCubit, TrendingMovieTodayState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TrendingMovieTodayCubit) {
            return LoadingCustom();
          }
          if (state is TrendingMovieTodaySuccess) {
            return RowSlideContent(
              state: state.trendingMovieToday,
              title: "Trending Movie Today",
            );
          }
          return Container();
        },
      );
    }

    Widget TrendingTvTodayContent() {
      return BlocConsumer<TrendingTvTodayCubit, TrendingTvTodayState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TrendingTvTodayCubit) {
            return LoadingCustom();
          }
          if (state is TrendingTvTodaySuccess) {
            return RowSlideContent(
              isTv: true,
              state: state.trendingTvToday,
              title: "Trending Tv Today",
            );
          }
          return Container();
        },
      );
    }

    Widget TopRatedTvSeriesContent() {
      return BlocConsumer<TopRatedTvCubit, TopRatedTvState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopRatedTvLoading) {
            return LoadingCustom();
          }
          if (state is TopRatedTvSuccess) {
            return CenterShowCarousel(
              isTv: true,
              title: "Top Rated Tv Series",
              state: state.topRatedTv,
            );
          }
          return Container();
        },
      );
    }

    Widget AllTrendingTodayContent() {
      return BlocConsumer<AllTrendingTodayCubit, AllTrendingTodayState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AllTrendingTodayLoading) {
            return LoadingCustom();
          }
          if (state is AllTrendingTodaySuccess) {
            return RowSlideContent(
              state: state.allTrending,
              title: "All Movie Tv Trending Today",
            );
          }
          return Container();
          
        },
      );
    }

    return Container(
      child: ListView(
        children: [
          HeadContent(),
          TopRatedContent(),
          SizedBox(height: 20),
          PopularMovieContent(),
          SizedBox(height: 20),
          ComingSoonMovieContent(),
          SizedBox(height: 32),
          NowPlayingMovieContent(),
          SizedBox(height: 32),
          TrendingMovieWeekContent(),
          SizedBox(height: 20),
          TrendingTvWeekContent(),
          SizedBox(height: 20),
          PopularTvContent(),
          SizedBox(height: 20),
          TrendingMovieTodayContent(),
          SizedBox(height: 20),
          TrendingTvTodayContent(),
          SizedBox(height: 32),
          TopRatedTvSeriesContent(),
          SizedBox(height: 32),
          AllTrendingTodayContent(),
          SizedBox(
            height: 172,
          ),
        ],
      ),
    );
  }
}
