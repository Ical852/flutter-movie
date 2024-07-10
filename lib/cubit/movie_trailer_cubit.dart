import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_trailer_state.dart';

class MovieTrailerCubit extends Cubit<MovieTrailerState> {
  MovieTrailerCubit() : super(MovieTrailerInitial());
}
