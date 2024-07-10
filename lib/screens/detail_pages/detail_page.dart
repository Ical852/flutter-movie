import 'package:flutter/material.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_content.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_img.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_layer.dart';
import 'package:movlix/screens/detail_pages/partials/cast.dart';
import 'package:movlix/screens/detail_pages/partials/synopsis.dart';
import 'package:movlix/screens/detail_pages/partials/trailer.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/widgets/row_slide_content.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget MainContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 380
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Synopsis(),
            SizedBox(height: 20,),
            Trailer(),
            SizedBox(height: 20,),
            Cast(),
            SizedBox(height: 20,),
            RowSlideContent(images: dummyList, title: "More Like This"),
            SizedBox(height: 172,)
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              BackdropImg(),
              BackdropLayer(),
              BackdropContent(),
              MainContent()
            ],
          ),
        ),
      ),
    );
  }
}
