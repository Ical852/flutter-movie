import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_trailer_state.dart';

class TvTrailerCubit extends Cubit<TvTrailerState> {
  TvTrailerCubit() : super(TvTrailerInitial());
}
