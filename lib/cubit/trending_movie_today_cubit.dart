import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_movie_today_state.dart';

class TrendingMovieTodayCubit extends Cubit<TrendingMovieTodayState> {
  TrendingMovieTodayCubit() : super(TrendingMovieTodayInitial());
}
