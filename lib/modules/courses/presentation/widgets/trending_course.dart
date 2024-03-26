import 'package:flutter/material.dart';
import 'package:hacker_rank/core/custom%20variables/custom_var.dart';

import '../../../../core/style/boxdecuration_style.dart';

// ignore: must_be_immutable
class TrendingCourse extends StatelessWidget {
  TrendingCourse({Key? key, required this.title, required this.url})
      : super(key: key);
  String title, url;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      padding: const EdgeInsets.only(bottom: 30),
      decoration: circularImageDecoration(
          radius: 10, url: url),
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 160,
        height: 70,
        decoration: circularDecoration(
          radius: 10,
          color: const Color(0xff292C31).withOpacity(.6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            Text(
              title,
              style: CustomVar.textTheme!.headline4,
            ),
            const Icon(
              Icons.play_circle,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
