import 'package:equatable/equatable.dart';
import 'package:hacker_rank/modules/courses/domin/intits/lecture.dart';

// ignore: must_be_immutable
class CourseEntity extends Equatable {
  String id,title, subtitle ,image, department;
  int term;
  List<Lecture>? lectures;
  CourseEntity(
      {required this.title,
      required this.subtitle,
      required this.id,
      required this.image,
      required this.term,
      required this.department,
      this.lectures});

  @override
  List<Object?> get props => [title, image, department, term,lectures];
}
