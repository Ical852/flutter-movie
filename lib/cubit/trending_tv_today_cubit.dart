import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_tv_today_state.dart';

class TrendingTvTodayCubit extends Cubit<TrendingTvTodayState> {
  TrendingTvTodayCubit() : super(TrendingTvTodayInitial());
}
