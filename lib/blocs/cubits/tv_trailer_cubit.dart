import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/trailer_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/tv_trailer_state.dart';

class TvTrailerCubit extends Cubit<TvTrailerState> {
  TvTrailerCubit() : super(TvTrailerInitial());

  void getTvTrailers(String id) async {
    emit(TvTrailerLoading());
    TrailerResponse? topRated = await MovieServices().getTvTrailers(id: id);
    if (topRated == null) emit(TvTrailerFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(TvTrailerSuccess(topRated!));
  }
}
