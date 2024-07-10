import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_cast_state.dart';

class TvCastCubit extends Cubit<TvCastState> {
  TvCastCubit() : super(TvCastInitial());
}
