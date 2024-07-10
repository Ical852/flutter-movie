part of '../cubits/movie_cast_cubit.dart';

sealed class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object> get props => [];
}

final class MovieCastInitial extends MovieCastState {}
