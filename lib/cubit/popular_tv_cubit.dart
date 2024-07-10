import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_tv_state.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvInitial());
}
