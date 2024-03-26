import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomVar {
  static TextTheme? textTheme;
  static Color mainGreenColor = Colors.green,
      mainBackgroundColor = const Color(0xff292C31);
  static FirebaseFirestore store = FirebaseFirestore.instance;
  static late SharedPreferences pref;

  static void initialSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }
}
