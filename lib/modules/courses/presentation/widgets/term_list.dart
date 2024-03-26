import 'package:flutter/material.dart';
import 'package:hacker_rank/modules/courses/domin/intits/course.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/playlist.dart';

// ignore: must_be_immutable
class TermList extends StatelessWidget {
  TermList({Key? key, required this.termCourses}) : super(key: key);
  List<CourseEntity> termCourses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: termCourses.length,
      itemBuilder: (context, index) {
        return PlaylistUi(
          title: termCourses[index].title,
          subtitle: termCourses[index].subtitle,
          url: "assets/images/java_image.png",
          id: termCourses[index].id,
        );
      },
    );
  }
}
