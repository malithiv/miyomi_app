import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late double textScaleFactor;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    textScaleFactor = _mediaQueryData.textScaleFactor;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  // Calculate size based on screen height (useful for consistent sizing across different devices)
  static double getProportionalHeight(double inputHeight) {
    // Baseline height of 812 (iPhone X/XS/11 Pro height)
    const double baselineHeight = 812.0;
    return (inputHeight / baselineHeight) * screenHeight;
  }

  // Calculate size based on screen width
  static double getProportionalWidth(double inputWidth) {
    // Baseline width of 375 (iPhone X/XS/11 Pro width)
    const double baselineWidth = 375.0;
    return (inputWidth / baselineWidth) * screenWidth;
  }

  // Get a responsive font size that won't be too small on large devices
  static double getResponsiveFontSize(double fontSize) {
    double scaleFactor = getScaleFactor();
    double responsiveFontSize = fontSize * scaleFactor;

    // Ensure font doesn't get too small on larger screens
    if (screenWidth > 600) {
      return responsiveFontSize * 0.8;
    } else {
      return responsiveFontSize;
    }
  }

  // Get a scale factor based on screen size
  static double getScaleFactor() {
    const double baselineHeight = 812.0;
    return screenHeight / baselineHeight;
  }
}