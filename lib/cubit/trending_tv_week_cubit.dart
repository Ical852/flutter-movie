import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_tv_week_state.dart';

class TrendingTvWeekCubit extends Cubit<TrendingTvWeekState> {
  TrendingTvWeekCubit() : super(TrendingTvWeekInitial());
}
