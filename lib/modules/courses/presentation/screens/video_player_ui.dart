import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_cubit.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_states.dart';
import 'package:hacker_rank/core/theme/main_theme.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/video%20controller/video_player_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerUi extends StatelessWidget {
  VideoPlayerUi({Key? key}) : super(key: key);

  late VideoPlayerCubit cubit;
  late RebuildCubit rebuildCubit;
  String imagePath = "";
  bool isFullScreen = false;
  @override
  Widget build(BuildContext context) {
    rebuildCubit = RebuildCubit.get(context);
    cubit = VideoPlayerCubit.get(context);
    // cubit.getVideo();
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          print(4000000000000);
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BlocBuilder<RebuildCubit, RebuildStates>(builder: (context, state) {
            return SizedBox(
              height: isFullScreen ? double.infinity : 300,
              child: YoutubePlayer(
                controller: cubit.youtubePlayerController,
                onReady: () {},
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Int Variables",
              style: MainTheme.mainTheme.textTheme.headline2,
            ),
          ),

         
        ]);
      }),
    );
  }
}
