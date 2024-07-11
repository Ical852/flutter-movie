import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/movie_cast_cubit.dart';
import 'package:movlix/blocs/cubits/movie_detail_cubit.dart';
import 'package:movlix/blocs/cubits/movie_recommendations_cubit.dart';
import 'package:movlix/blocs/cubits/movie_trailer_cubit.dart';
import 'package:movlix/models/detail_response.dart';
import 'package:movlix/screens/detail_pages/movie/partials/backdrop_content.dart';
import 'package:movlix/screens/detail_pages/movie/partials/backdrop_img.dart';
import 'package:movlix/screens/detail_pages/movie/partials/backdrop_layer.dart';
import 'package:movlix/screens/detail_pages/movie/partials/cast.dart';
import 'package:movlix/screens/detail_pages/movie/partials/synopsis.dart';
import 'package:movlix/screens/detail_pages/movie/partials/trailer.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/widgets/loading_custom.dart';
import 'package:movlix/widgets/row_slide_content.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({super.key});

  @override
  Widget build(BuildContext context) {
    Widget MainContent(DetailResponse detail) {
      return Container(
        margin: EdgeInsets.only(top: 380),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Synopsis(
              detail: detail,
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<MovieTrailerCubit, MovieTrailerState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is MovieTrailerLoading) {
                  return LoadingCustom();
                }
                if (state is MovieTrailerSuccess) {
                  return Trailer(
                    trailer: state.trailer,
                    detail: detail,
                  );
                }
                return Container();
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<MovieCastCubit, MovieCastState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is MovieCastLoading) {
                  return LoadingCustom();
                }
                if (state is MovieCastSuccess) {
                  return Cast(state: state.cast);
                }
                return Container();
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<MovieRecommendationsCubit, MovieRecommendationsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is MovieRecommendationsLoading) {
                  return LoadingCustom();
                }
                if (state is MovieRecommendationsSuccess) {
                  return RowSlideContent(
                      isDetail: true,
                      state: state.recommendations,
                      title: "More Like This");
                }
                return Container();
              },
            ),
            SizedBox(
              height: 72,
            )
          ],
        ),
      );
    }

    return BlocConsumer<MovieDetailCubit, MovieDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MovieDetailLoading) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            ),
          );
        }
        if (state is MovieDetailSuccess) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                BackdropImg(
                  detail: state.detail,
                ),
                BackdropLayer(),
                BackdropContent(
                  detail: state.detail,
                ),
                MainContent(state.detail)
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}