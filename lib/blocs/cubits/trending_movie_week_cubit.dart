import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/trending_movie_week_state.dart';

class TrendingMovieWeekCubit extends Cubit<TrendingMovieWeekState> {
  TrendingMovieWeekCubit() : super(TrendingMovieWeekInitial());

  void getTrendingMovieWeek() async {
    emit(TrendingMovieWeekLoading());
    FetchResponse? trendingMovieWeek = await MovieServices().getTrendingMovieWeek();
    if (trendingMovieWeek == null) emit(TrendingMovieWeekFailed("Failed to get top rated"));
    if (isNotNull(trendingMovieWeek)) emit(TrendingMovieWeekSuccess(trendingMovieWeek!));
  }
}
