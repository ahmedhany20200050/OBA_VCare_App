import 'dart:math';
import 'package:flutter/material.dart';

class SizeConfig {
  static const double designWidth = 360;
  static const double designHeight = 640;
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double horizontalBlock;
  static late double verticalBlock;
  static late double textRatio;
  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    // statusBarHeight = _mediaQueryData.padding.top;
    horizontalBlock = (screenWidth) / designWidth;
    verticalBlock = (screenHeight) / (designHeight);
    textRatio = min(verticalBlock, horizontalBlock);
  }
}
