import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_tv_state.dart';

class TopRatedTvCubit extends Cubit<TopRatedTvState> {
  TopRatedTvCubit() : super(TopRatedTvInitial());
}
