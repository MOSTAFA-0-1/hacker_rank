import 'package:equatable/equatable.dart';
import 'package:hacker_rank/core/enums/data_state_enum.dart';
import 'package:hacker_rank/modules/courses/domin/intits/lecture.dart';

// ignore: must_be_immutable
class CourseDataCubitStates extends Equatable {
  List<Lecture> lectures;
  DataStates dataStates;

  CourseDataCubitStates(
      {this.lectures = const [], this.dataStates = DataStates.loading});

  CourseDataCubitStates copyWith(
      {List<Lecture>? lectures, DataStates? dataStates}) {
    return CourseDataCubitStates(
        lectures: lectures ?? this.lectures,
        dataStates: dataStates ?? this.dataStates);
  }

  @override
  List<Object?> get props => [lectures, dataStates];
}
