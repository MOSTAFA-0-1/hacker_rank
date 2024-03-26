import 'package:flutter/material.dart';
import 'package:hacker_rank/core/transtion/animated_navigation.dart';
import 'package:hacker_rank/modules/courses/domin/intits/lecture.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/course%20data/course_data_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/video%20controller/video_player_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/test.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/video_player_ui.dart';

import '../../../../core/custom variables/custom_var.dart';
import '../../../../core/style/boxdecuration_style.dart';

// ignore: must_be_immutable
class VideoListItem extends StatelessWidget {
  VideoListItem({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        lecture.title,
        style: CustomVar.textTheme!.headline4,
      ),
      onTap: () {
        VideoPlayerCubit.get(context).setLecture(lecture);
        animatedPush(context, Play());
      },
      leading: SizedBox(
        width: 80,
        child: lecture.thumbnailUrl.isEmpty
            ? const Icon(
                Icons.video_collection_outlined,
                color: Colors.green,
              )
            : Image.network(lecture.thumbnailUrl),
      ),
      trailing: Container(
        width: 80,
        height: 40,
        decoration: circularDecoration(radius: 20, color: Colors.green),
        child: const Center(
            child: Icon(
          Icons.play_circle,
          color: Colors.white,
        )),
      ),
    );
  }
}
