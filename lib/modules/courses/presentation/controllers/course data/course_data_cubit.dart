import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/enums/data_state_enum.dart';
import '../../../data/model/lecture_model.dart';
import 'course_data_states.dart';

class CourseDataCubit extends Cubit<CourseDataCubitStates> {
  CourseDataCubit() : super(CourseDataCubitStates());

  static CourseDataCubit get(BuildContext context) {
    return BlocProvider.of<CourseDataCubit>(context);
  }

  void getCourseVideos(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    docs.map((e) {
      state.lectures.add(LectureModel.read(e.data()));
    }).toList();
    emit(state.copyWith(dataStates: DataStates.loaded));
  }
}
