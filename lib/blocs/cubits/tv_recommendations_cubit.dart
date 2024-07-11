import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/tv_recommendations_state.dart';

class TvRecommendationsCubit extends Cubit<TvRecommendationsState> {
  TvRecommendationsCubit() : super(TvRecommendationsInitial());

  void getTvRecommendations(String id) async {
    emit(TvRecommendationsLoading());
    FetchResponse? topRated = await MovieServices().getTvRecommendations(id: id);
    if (topRated == null)
      emit(TvRecommendationsFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(TvRecommendationsSuccess(topRated!));
  }
}
