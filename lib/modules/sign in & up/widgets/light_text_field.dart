import 'package:flutter/material.dart';
import 'package:hacker_rank/core/style/boxdecuration_style.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_cubit.dart';

import '../../../core/enums/textfield_enum.dart';

// ignore: must_be_immutable
class LightTextField extends StatelessWidget {
  LightTextField(
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
  late CoursesCubit cubit;
  @override
  Widget build(BuildContext context) {
    cubit = CoursesCubit.get(context);
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: circularDecoration(
        radius: 25,
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        style: TextStyle(color: Colors.grey.withOpacity(.9)),
        controller: textEditingController,
        obscureText: textFieldStates == TextFieldStates.password,
        keyboardType: textFieldStates == TextFieldStates.email
            ? TextInputType.emailAddress
            : TextInputType.text,
        onChanged: (value) {
           cubit.search(value);
        } ,
        decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: Colors.grey.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.grey.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
