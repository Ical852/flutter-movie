import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../states/movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  MovieCastCubit() : super(MovieCastInitial());
}
