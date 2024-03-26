import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hacker_rank/core/sizes/screen_size.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/video%20controller/video_player_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/theme/main_theme.dart';
import '../widgets/video_ui.dart';

class Play extends StatelessWidget {
  Play({Key? key}) : super(key: key);
  late VideoPlayerCubit videoPlayerCubit;
  @override
  Widget build(BuildContext context) {
    videoPlayerCubit = VideoPlayerCubit.get(context);
    videoPlayerCubit.getVideo();
    return WillPopScope(
      onWillPop: () async {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          return false;
        }

        return true;
      },
      child: Scaffold(body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          height: double.infinity,
          child: Stack(children: [
            YoutubePlayer(
                controller:
                    VideoPlayerCubit.get(context).youtubePlayerController),
           
           
            if (orientation == Orientation.portrait)
            Positioned(
              top: 230,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  videoPlayerCubit.lecture.title,
                  style: MainTheme.mainTheme.textTheme.headline1,
                ),
              ),
            ),
            if (orientation == Orientation.portrait)
              Positioned(
                  top: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 200,
                            width: ScreenSize.width * .98,
                            child: ListView.builder(
                                itemCount:
                                    CoursesCubit.get(context).lectures.length,
                                itemBuilder: (context, index) {
                                  return VideoListItem(
                                    lecture: CoursesCubit.get(context)
                                        .lectures[index],
                                  );
                                })),
                      ],
                    ),
                  ))
          ]),
        );
      })),
    );
  }
}
