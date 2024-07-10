import 'package:flutter/material.dart';
import 'package:movlix/shared/dummies.dart';
import 'package:movlix/widgets/image_custom.dart';

class BackdropImg extends StatelessWidget {
  const BackdropImg({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageCustom(
      height: 360,
      width: double.infinity,
      image: AssetImage(dummyImg),
      fit: BoxFit.cover,
    );
  }
}