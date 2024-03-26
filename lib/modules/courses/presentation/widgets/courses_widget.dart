import 'package:flutter/material.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/term_list.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/trending_course.dart';

import '../../../../core/custom variables/custom_var.dart';
import '../controllers/courses cubit/courses_cubit.dart';

// ignore: must_be_immutable
class CoursesWidget extends StatelessWidget {
  CoursesWidget({Key? key, required this.coursesCubit}) : super(key: key);

  CoursesCubit coursesCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Trending Courses",
          style: CustomVar.textTheme!.headline1,
        ),
        SizedBox(
          height: 260,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TrendingCourse(
                  title: "Java", url: "assets/images/java_image.png");
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Playlists",
            style: CustomVar.textTheme!.headline1,
          ),
        ),
        TabBar(
          isScrollable: true,
          labelColor: Colors.green,
          indicatorColor: Colors.green,
          unselectedLabelColor: Colors.white,
          dividerHeight: 0,
          padding: EdgeInsets.zero,
          tabs: [
            for (int i = 0; i < 10; i++) ...[
              if (i == 0)
                const Tab(
                  text: "All",
                )
              else if (i == 9)
                const Tab(
                  text: "Summer",
                )
              else
                Tab(
                  text: "Term $i",
                )
            ]
          ],
          automaticIndicatorColorAdjustment: true,
        ),
        SizedBox(
          height: 300,
          child: TabBarView(children: [
            for (int i = 0; i < 10; i++) ...{
              if (i == 0)
                TermList(termCourses: coursesCubit.cousres)
              else
                TermList(
                    termCourses: coursesCubit.cousres
                        .where((element) => element.term == i)
                        .toList())
            }
          ]),
        ),
      ],
    );
  }
}
