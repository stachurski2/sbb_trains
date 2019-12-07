
import 'package:flutter/material.dart';

class ColorProvider {
  static final ColorProvider shared = ColorProvider._internal();

  factory ColorProvider() {
    return shared;
  }
  ColorProvider._internal();

  Color standardAppBackgroundColor =  Color.fromRGBO(227, 51, 62, 1.0);

  Color onBoardingBackgroundColor =  Color.fromRGBO(248, 248, 255, 1.0);

  Color standardButttonTextColor =  Color.fromRGBO(249, 255, 249, 1.0);

}