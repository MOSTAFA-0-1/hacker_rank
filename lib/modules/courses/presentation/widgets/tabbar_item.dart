import 'package:flutter/material.dart';
import 'package:hacker_rank/core/custom%20variables/custom_var.dart';

// ignore: must_be_immutable
class TabBarButton extends StatelessWidget {
  TabBarButton(
      {Key? key,
      required this.title,
      required this.radius,
      required this.function,
      required this.isSelected})
      : super(key: key);
  double radius;
  bool isSelected;
  String title;
  Function function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(isSelected
                ? CustomVar.mainGreenColor
                : CustomVar.mainBackgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
        onPressed: () => function(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: isSelected ? Colors.white : Colors.green),
            ),
            Icon(
              Icons.play_circle,
              color: isSelected ? Colors.white : Colors.green,
            )
          ],
        ));
  }
}
