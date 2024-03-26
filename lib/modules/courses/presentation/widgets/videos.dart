import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/video_ui.dart';

import '../../../../core/custom variables/custom_var.dart';

class Videos extends StatelessWidget {
  Videos({Key? key}) : super(key: key);

  late CoursesCubit coursesCubit;
  @override
  Widget build(BuildContext context) {
    coursesCubit = CoursesCubit.get(context);

    return Center(
      child: StreamBuilder(
          stream: CustomVar.store
              .collection("courses")
              .doc(CoursesCubit.id)
              .collection("videos")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              coursesCubit.getCourseVideos(snapshot.data!.docs
                  as List<QueryDocumentSnapshot<Map<String, dynamic>>>);
              return ListView.builder(
                itemCount: coursesCubit.lectures.length,
                itemBuilder: (context, index) {
                  return VideoListItem(
                    lecture: coursesCubit.lectures[index],
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
