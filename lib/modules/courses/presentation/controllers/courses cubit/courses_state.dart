import 'package:equatable/equatable.dart';

// class CoursesCubitStates extends Equatable {
//   List<CourseEntity> cousres;
//   DataStates dataStates;

//   CoursesCubitStates(
//       {this.cousres = const [], this.dataStates = DataStates.loading});

//   CoursesCubitStates copyWith(
//       {List<CourseEntity>? cousres, DataStates? dataStates}) {
//     return CoursesCubitStates(
//         cousres: cousres ?? this.cousres,
//         dataStates: dataStates ?? this.dataStates);
//   }

//   @override
//   List<Object?> get props => [cousres, dataStates];
// }

abstract class CoursesCubitStates {}

class IntitCoursesState extends CoursesCubitStates {}

class GetCoursesState extends CoursesCubitStates {}

class LoadingCoursesState extends CoursesCubitStates {}

class UpdateState extends CoursesCubitStates {}

class ErrorCoursesState extends CoursesCubitStates {}
