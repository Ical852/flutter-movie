import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/trailer_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/movie_trailer_state.dart';

class MovieTrailerCubit extends Cubit<MovieTrailerState> {
  MovieTrailerCubit() : super(MovieTrailerInitial());

  void getMovieTrailers(String id) async {
    emit(MovieTrailerLoading());
    TrailerResponse? topRated = await MovieServices().getMovieTrailers(id: id);
    if (topRated == null) emit(MovieTrailerFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(MovieTrailerSuccess(topRated!));
  }
}
