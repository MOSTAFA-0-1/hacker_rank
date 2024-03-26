import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_cubit.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_states.dart';
import 'package:hacker_rank/core/custom%20variables/custom_var.dart';
import 'package:hacker_rank/core/style/boxdecuration_style.dart';
import 'package:hacker_rank/core/transtion/animated_navigation.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/courses.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  List<TextEditingController> controllers =
      List.generate(3, (index) => TextEditingController());

  List<String> departments = ["general","courses" ,"sc", "medicine"];
  String value = "general";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 180,
                height: 180,
                child: Image.asset("assets/images/logo.jpg"),
              ),
              Container(
                  height: 50,
                  width: 320,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration:
                      circularDecoration(radius: 20, color: Colors.white),
                  child: BlocBuilder<RebuildCubit, RebuildStates>(
                      builder: (context, state) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        items: departments
                            .map<DropdownMenuItem<String>>((value) =>
                                DropdownMenuItem(
                                    value: value, child: Text(value)))
                            .toList(),
                        onChanged: (changedValue) {
                          value = changedValue ?? value;
                          RebuildCubit.get(context).rebuild();
                        },
                      ),
                    );
                  })),
              InkWell(
                onTap: () {
                  CustomVar.pref.setString("department", value);
                  pushReplacement(context, Courses());
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Color(0xff09090A),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                        child: Container(
                      width: 80,
                      height: 80,
                      decoration: circularDecoration(
                        radius: 40,
                        color: const Color(0xffA9DED8),
                      ),
                      child: const Center(child: Text("LOG IN")),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
