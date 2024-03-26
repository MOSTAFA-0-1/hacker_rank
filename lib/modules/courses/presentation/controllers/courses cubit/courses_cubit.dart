import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/get_it%20service/service.dart';
import 'package:hacker_rank/modules/courses/data/model/lecture_model.dart';
import 'package:hacker_rank/modules/courses/domin/intits/lecture.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_state.dart';

import '../../../domin/intits/course.dart';
import '../../../domin/usecase/get_courses.dart';

class CoursesCubit extends Cubit<CoursesCubitStates> {
  CoursesCubit() : super(IntitCoursesState());

  static CoursesCubit get(BuildContext context) {
    return BlocProvider.of<CoursesCubit>(context);
  }

  List<CourseEntity> cousres = [];
  List<CourseEntity> coursesSearchResults = [];

  bool isSearching = false;
  static String id = "";
  String error = "";

  void setIsSearchingValue(bool value) {
    isSearching = value;
    emit(UpdateState());
  }

  void search(String value) {
    if (value.isEmpty) {
      setIsSearchingValue(false);
    } else {
      setIsSearchingValue(true);
    }
    coursesSearchResults = cousres
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  void getCourses() async {
    emit(LoadingCoursesState());
    final response = await sl<GetCourses>().excute();
    response.fold((l) {
      print(l.massage);
      error = l.massage;
      emit(ErrorCoursesState());
    }, (r) {
      print("done");

      cousres = r;
      emit(GetCoursesState());
    });
  }

  List<Lecture> lectures = [];
  void getCourseVideos(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    lectures.clear();
    docs.map((e) {
      lectures.add(LectureModel.read(e.data()));
    }).toList();
  }
}
