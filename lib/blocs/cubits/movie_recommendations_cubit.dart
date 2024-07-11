import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/movie_recommendations_state.dart';

class MovieRecommendationsCubit extends Cubit<MovieRecommendationsState> {
  MovieRecommendationsCubit() : super(MovieRecommendationsInitial());

  void getMovieRecommendations(String id) async {
    emit(MovieRecommendationsLoading());
    FetchResponse? topRated = await MovieServices().getMovieRecommendations(id: id);
    if (topRated == null)emit(MovieRecommendationsFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(MovieRecommendationsSuccess(topRated!));
  }
}
