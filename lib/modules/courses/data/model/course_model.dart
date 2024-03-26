import 'package:hacker_rank/modules/courses/domin/intits/course.dart';

// ignore: must_be_immutable
class CourseModel extends CourseEntity {
  CourseModel(
      {required super.title,
      required super.subtitle,
      required super.id,
      required super.image,
      required super.term,
      required super.department});

  factory CourseModel.read(Map<String, dynamic> fireData, String id) {
    return CourseModel(
        id: id,
        subtitle: fireData["subtitle"]??"",
        title: fireData["title"]??"",
        image: fireData["image"]??"",
        term: fireData["term"]??"",
        department: fireData["department"]??"");
  }
}
