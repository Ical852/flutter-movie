import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_trending_today_state.dart';

class AllTrendingTodayCubit extends Cubit<AllTrendingTodayState> {
  AllTrendingTodayCubit() : super(AllTrendingTodayInitial());
}
