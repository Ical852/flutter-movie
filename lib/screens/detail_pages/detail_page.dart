import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movlix/blocs/cubits/movie_detail_cubit.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_content.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_img.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_layer.dart';
import 'package:movlix/screens/detail_pages/partials/cast.dart';
import 'package:movlix/screens/detail_pages/partials/synopsis.dart';
import 'package:movlix/screens/detail_pages/partials/trailer.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/view_models/detail/detail_view_model.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  Results detail;
  DetailPage(this.detail);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailViewModel detailVM = DetailViewModel(context);

  @override
  void initState() {
    super.initState();
    detailVM.getDetail(this.widget.detail.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget MainContent() {
      return Container(
        margin: EdgeInsets.only(top: 380),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Synopsis(),
            SizedBox(
              height: 20,
            ),
            Trailer(),
            SizedBox(
              height: 20,
            ),
            Cast(),
            SizedBox(
              height: 20,
            ),
            // RowSlideContent(images: dummyList, title: "More Like This"),
            SizedBox(
              height: 172,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: BlocConsumer<MovieDetailCubit, MovieDetailState>(
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
                    BackdropImg(),
                    BackdropLayer(),
                    BackdropContent(),
                    MainContent()
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
