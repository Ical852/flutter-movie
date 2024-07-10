import 'package:flutter/material.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_content.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_img.dart';
import 'package:movlix/screens/detail_pages/partials/backdrop_layer.dart';
import 'package:movlix/screens/detail_pages/partials/synopsis.dart';
import 'package:movlix/shared/constants.dart';

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
          children: [
            Synopsis()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Stack(
          children: [
            BackdropImg(),
            BackdropLayer(),
            BackdropContent(),
            MainContent()
          ],
        ),
      ),
    );
  }
}
