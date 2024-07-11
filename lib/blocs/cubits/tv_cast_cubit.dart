import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/cast_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/tv_cast_state.dart';

class TvCastCubit extends Cubit<TvCastState> {
  TvCastCubit() : super(TvCastInitial());

  void getTvCasts(String id) async {
    emit(TvCastLoading());
    CastResponse? topRated = await MovieServices().getTvCasts(id: id);
    if (topRated == null) emit(TvCastFailed("Failed to get coming soon"));
    if (isNotNull(topRated)) emit(TvCastSuccess(topRated!));
  }
}
