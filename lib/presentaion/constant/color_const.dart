import 'package:flutter/material.dart';

class ColorConst {
  static const primaryColor = Color(0xff37A389);
  static const primaryLight = Color(0xffBCDED3);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const fontColor01 = Color(0xFF2F4050);
  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF25164d), Colors.white],
  );

  ///Singleton factory
  // static final ColorConst _instance = ColorConst._internal();

  // factory ColorConst() {
  //   return _instance;
  // }

  // ColorConst._internal();
}

// const mAnimationDuration = Duration(milliseconds: 200);
