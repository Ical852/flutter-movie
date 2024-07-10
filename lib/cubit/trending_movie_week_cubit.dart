import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_movie_week_state.dart';

class TrendingMovieWeekCubit extends Cubit<TrendingMovieWeekState> {
  TrendingMovieWeekCubit() : super(TrendingMovieWeekInitial());
}
