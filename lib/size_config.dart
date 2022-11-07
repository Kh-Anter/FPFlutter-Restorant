import 'package:flutter/material.dart';

class SizeConfig {
  BuildContext ctx;
  SizeConfig(ctx) {
    this.ctx = ctx;
    init(ctx);
  }
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  get getWidth {
    // if (orientation.name == "portrait") {
    //   return screenWidth;
    // } else {
    //   return screenWidth / 1.5;
    // }
    return screenWidth;
  }

  get getHeight {
    return screenHeight;
  }

  get getOriantation {
    return orientation;
  }

// Get the proportionate height as per screen size
  double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = SizeConfig.screenHeight;
    // 896 is the layout height that designer use
    return (inputHeight / 896.0) * screenHeight;
  }

// Get the proportionate height as per screen size
  double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = SizeConfig.screenWidth;
    // 414 is the layout width that designer use
    return (inputWidth / 414.0) * screenWidth;
  }
}
