import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/tv_cast_cubit.dart';
import 'package:movlix/blocs/cubits/tv_detail_cubit.dart';
import 'package:movlix/blocs/cubits/tv_recommendations_cubit.dart';
import 'package:movlix/blocs/cubits/tv_trailer_cubit.dart';
import 'package:movlix/models/detail_tv_response.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/screens/detail_pages/tv/partials/backdrop_content.dart';
import 'package:movlix/screens/detail_pages/tv/partials/backdrop_img.dart';
import 'package:movlix/screens/detail_pages/tv/partials/backdrop_layer.dart';
import 'package:movlix/screens/detail_pages/tv/partials/cast.dart';
import 'package:movlix/screens/detail_pages/tv/partials/synopsis.dart';
import 'package:movlix/screens/detail_pages/tv/partials/trailer.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/widgets/loading_custom.dart';
import 'package:movlix/widgets/row_slide_content.dart';

// ignore: must_be_immutable
class DetailTv extends StatelessWidget {
  Results mainDetail;
  DetailTv({super.key, required this.mainDetail});

  @override
  Widget build(BuildContext context) {
    Widget MainContent(DetailTvResponse detail) {
      return Container(
        margin: EdgeInsets.only(top: 380),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Synopsis(
              mainDetail: mainDetail,
              detail: detail,
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<TvTrailerCubit, TvTrailerState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is TvTrailerLoading) {
                  return LoadingCustom();
                }
                if (state is TvTrailerSuccess) {
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
            BlocConsumer<TvCastCubit, TvCastState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is TvCastLoading) {
                  return LoadingCustom();
                }
                if (state is TvCastSuccess) {
                  return Cast(state: state.cast);
                }
                return Container();
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<TvRecommendationsCubit, TvRecommendationsState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is TvRecommendationsLoading) {
                  return LoadingCustom();
                }
                if (state is TvRecommendationsSuccess) {
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

    return BlocConsumer<TvDetailCubit, TvDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is TvDetailLoading) {
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
        if (state is TvDetailSuccess) {
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
