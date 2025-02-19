import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/trending_movie_today_state.dart';

class TrendingMovieTodayCubit extends Cubit<TrendingMovieTodayState> {
  TrendingMovieTodayCubit() : super(TrendingMovieTodayInitial());

  void getTrendingMovieToday() async {
    emit(TrendingMovieTodayLoading());
    FetchResponse? trendingMovieToday = await MovieServices().getTrendingMovieToday();
    if (trendingMovieToday == null) emit(TrendingMovieTodayFailed("Failed to get top rated"));
    if (isNotNull(trendingMovieToday)) emit(TrendingMovieTodaySuccess(trendingMovieToday!));
  }
}
