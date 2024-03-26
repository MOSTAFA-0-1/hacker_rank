import 'package:flutter/material.dart';

BoxDecoration circularDecoration({required double radius, Color? color}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius), color: color);
}

BoxDecoration circularImageDecoration(
    {required double radius, required String url}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      image: DecorationImage(image: AssetImage(url),fit: BoxFit.fill));
}
