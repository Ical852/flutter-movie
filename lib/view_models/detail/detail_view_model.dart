import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/movie_cast_cubit.dart';
import 'package:movlix/blocs/cubits/movie_detail_cubit.dart';
import 'package:movlix/blocs/cubits/movie_recommendations_cubit.dart';
import 'package:movlix/functions/global_func.dart';

class DetailViewModel {
  late BuildContext context;

  DetailViewModel(BuildContext context) {
    this.context = context;
  }

  void getDetail(String id) {
    try {
      context.read<MovieDetailCubit>().getMovieDetail(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get detail", context);
    }
  }

  void getRecommendations(String id) {
    try {
      context.read<MovieRecommendationsCubit>().getMovieRecommendations(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get recommendations", context);
    }
  }

  void getCasts(String id) {
    try {
      context.read<MovieCastCubit>().getMovieCasts(id);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get casts", context);
    }
  }
}
