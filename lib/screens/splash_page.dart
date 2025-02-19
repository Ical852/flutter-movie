import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movlix/functions/global_func.dart';
import 'package:movlix/shared/constants.dart';
import 'package:movlix/shared/text_styles.dart';
import 'package:movlix/widgets/image_custom.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageCustom(
                  height: 120,
                  width: 120,
                  image: AssetImage(getIC("ic_logo.png")),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Movlix",
                  style: mass.white.semiBold,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
