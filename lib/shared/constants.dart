import 'package:flutter/material.dart';

double xSmallSize = 10;
double smallSize = 12;
double regularSize = 14;
double mediumSize = 16;
double baseSize = 18;
double megaSize = 20;
double extraSize = 24;
double massSize = 32;

Color blackColor = Color(0xff151515);
Color whiteColor = Color(0xFFDEDDDF);
Color redColor = Color(0xffE82626);
Color infoColor = Color(0xff509CE4);
Color successColor = Color(0xff61B176);
Color greyColor = Color(0xff777777);
Color greyColor2 = Color(0xff767680).withOpacity(0.12);

Color primary = blackColor;
Color secondary = redColor;
Color text = whiteColor;

FontWeight fontLight = FontWeight.w300;
FontWeight fontRegular = FontWeight.w400;
FontWeight fontMedium = FontWeight.w500;
FontWeight fontSemiBold = FontWeight.w600;
FontWeight fontBold = FontWeight.w700;
FontWeight fontExtraBold = FontWeight.w800;
FontWeight fontBlackBold = FontWeight.w900;

double safeAreaPadding(context) {
  return MediaQuery.of(context).padding.top;
}

double bottomSafeAreaPadding(context) {
  return MediaQuery.of(context).padding.bottom;
}
