import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_cubit.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_states.dart';
import 'package:hacker_rank/core/style/boxdecuration_style.dart';

// ignore: must_be_immutable
class MyDropDownButton extends StatelessWidget {
  MyDropDownButton({Key? key}) : super(key: key);
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RebuildCubit, RebuildStates>(builder: (context, state) {
      return Container(
        width: 150,
        height: 60,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: circularDecoration(radius: 30, color: Colors.white),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          iconEnabledColor: Colors.grey,
          elevation: 20,
          style: const TextStyle(color: Colors.grey),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          onChanged: (String? newValue) {
            dropdownValue = newValue!;
            RebuildCubit.get(context).rebuild();
          },
          items: <String>['One', 'Two', 'Three', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(width: 100, child: Text(value)),
            );
          }).toList(),
        ),
      );
    });
  }
}
