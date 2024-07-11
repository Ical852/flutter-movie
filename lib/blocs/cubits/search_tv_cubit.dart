import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/services/movie_services.dart';

part '../states/search_tv_state.dart';

class SearchTvCubit extends Cubit<SearchTvState> {
  SearchTvCubit() : super(SearchTvInitial());

  void searchTv(String search) async {
    emit(SearchTvLoading());
    FetchResponse? searchRes = await MovieServices().searchTv(search: search);
    if (searchRes == null) emit(SearchTvFailed("Failed to get search"));
    if (isNotNull(searchRes)) emit(SearchTvSuccess(searchRes!));
  }
}
