import 'package:flutter/material.dart';

class ScreenSize {
  static double width = 0, height = 0;
  static getMediaSize(Size size) {
    width = size.width;
    height = size.height;
  }
}
