import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/detail_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());

  void getMovieDetail(String id) async {
    emit(MovieDetailLoading());
    DetailResponse? detail = await MovieServices().getMovieDetail(id: id);
    if (detail == null) emit(MovieDetailFailed("Failed to get now playing"));
    if (isNotNull(detail)) emit(MovieDetailSuccess(detail!));
  }
}
