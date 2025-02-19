import 'package:flutter/material.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/models/detail_response.dart';
import 'package:movlix/widgets/image_custom.dart';

// ignore: must_be_immutable
class BackdropImg extends StatelessWidget {
  DetailResponse detail;
  BackdropImg({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return ImageCustom(
      height: 360,
      width: double.infinity,
      image: NetworkImage(getPosterUrl(detail.backdropPath!)),
      fit: BoxFit.cover,
    );
  }
}