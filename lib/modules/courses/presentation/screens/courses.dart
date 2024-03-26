import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/custom%20variables/custom_var.dart';
import 'package:hacker_rank/core/enums/textfield_enum.dart';
import 'package:hacker_rank/core/sizes/screen_size.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_state.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/courses_widget.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/term_list.dart';
import 'package:hacker_rank/modules/sign%20in%20&%20up/widgets/light_text_field.dart';

// ignore: must_be_immutable
class Courses extends StatelessWidget {
  Courses({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  late CoursesCubit coursesCubit;
  @override
  Widget build(BuildContext context) {
    coursesCubit = CoursesCubit.get(context);
    coursesCubit.getCourses();
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<CoursesCubit, CoursesCubitStates>(
            builder: (context, state) {
              if (state is ErrorCoursesState) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: ScreenSize.height/2-20),
                  child: Center(
                    child: Text(coursesCubit.error,style: TextStyle(color: Colors.white),),
                  ),
                );
              } else {
                if (coursesCubit.cousres.isEmpty) {
                  coursesCubit.getCourses();
                  return Padding(
                    padding: EdgeInsets.only(top: ScreenSize.height * .48),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }

                return Container(
                  padding: const EdgeInsets.all(13),
                  margin: const EdgeInsets.only(top: 60),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xff292C31),
                    Color(0xff09090A),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Welcome", style: CustomVar.textTheme!.headline4),
                      Text(
                        "Enjoy your favourite Courses",
                        style: CustomVar.textTheme!.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: LightTextField(
                            hintText: "search",
                            icon: Icons.search,
                            textFieldStates: TextFieldStates.normal,
                            textEditingController: controller),
                      ),
                      if (coursesCubit.isSearching)
                        SizedBox(
                            height: ScreenSize.height * .7,
                            child: TermList(
                                termCourses:
                                    coursesCubit.coursesSearchResults)),
                      if (!coursesCubit.isSearching)
                        CoursesWidget(coursesCubit: coursesCubit)
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
