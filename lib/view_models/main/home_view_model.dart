import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/coming_soon_movie_cubit.dart';
import 'package:movlix/blocs/cubits/now_playing_movie_cubit.dart';
import 'package:movlix/blocs/cubits/popular_movie_cubit.dart';
import 'package:movlix/blocs/cubits/search_movie_cubit.dart';
import 'package:movlix/blocs/cubits/top_rated_movie_cubit.dart';
import 'package:movlix/functions/global_func.dart';

class HomeViewModel {
  late BuildContext context;

  HomeViewModel(BuildContext context) {
    this.context = context;
  }

  void getTopRated() {
    try {
      context.read<TopRatedMovieCubit>().getTopRated();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get top rated", context);
    }
  }

  void getPopular() {
    try {
      context.read<PopularMovieCubit>().getPopular();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get popular", context);
    }
  }

  void getComingSoon() {
    try {
      context.read<ComingSoonMovieCubit>().getComingSoon();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get coming soon", context);
    }
  }

  void getNowPlaying() {
    try {
      context.read<NowPlayingMovieCubit>().getNowPlaying();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get now playing", context);
    }
  }

  void searchMovie(String search) {
    try {
      context.read<SearchMovieCubit>().searchMovie(search);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get search", context);
    }
  }
}
