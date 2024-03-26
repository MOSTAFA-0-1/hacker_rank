import 'package:flutter/material.dart';
import 'package:hacker_rank/core/style/boxdecuration_style.dart';

import '../../../core/enums/textfield_enum.dart';

// ignore: must_be_immutable
class DarkTextField extends StatelessWidget {
  DarkTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.textFieldStates,
      required this.textEditingController})
      : super(key: key);

  TextEditingController textEditingController;
   TextFieldStates textFieldStates;
  String hintText;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 300,
      height: 60,
      decoration: circularDecoration(radius: 25,color:  const Color(0xff212428),),
      margin: const EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(color: Colors.white.withOpacity(.9)),
        controller: textEditingController,
        obscureText: textFieldStates == TextFieldStates.password,
        keyboardType: textFieldStates == TextFieldStates.email ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
