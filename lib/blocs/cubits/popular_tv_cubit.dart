import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvInitial());

  void getPopularTv() async {
    emit(PopularTvLoading());
    FetchResponse? trendingTvWeek = await MovieServices().getPopularTv();
    if (trendingTvWeek == null) emit(PopularTvFailed("Failed to get top rated"));
    if (isNotNull(trendingTvWeek)) emit(PopularTvSuccess(trendingTvWeek!));
  }
}
