import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/coming_soon_movie_state.dart';

class ComingSoonMovieCubit extends Cubit<ComingSoonMovieState> {
  ComingSoonMovieCubit() : super(ComingSoonMovieInitial());

  void getComingSoon() async {
    emit(ComingSoonMovieLoading());
    FetchResponse? topRated = await MovieServices().getComingSoon();
    if (topRated == null) emit(ComingSoonMovieFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(ComingSoonMovieSuccess(topRated!));
  }
}
