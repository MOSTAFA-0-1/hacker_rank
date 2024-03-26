import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadiusButton extends StatelessWidget {
  RadiusButton(
      {Key? key, required this.text, required this.radius,required this.function, this.borderColor,required this.backgroundColor})
      : super(key: key);
  double radius;
  Color? borderColor;
  Color backgroundColor;
  String text;
  Function function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: borderColor == null
                        ? BorderSide.none
                        : BorderSide(color: borderColor!)))),
        onPressed: ()=> function(),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20,color: Colors.green),
        ));
  }
}
