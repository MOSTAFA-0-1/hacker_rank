import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/modules/courses/domin/intits/lecture.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/video%20controller/video_player_states.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerCubitStates> {
  VideoPlayerCubit() : super(InitialState());

  late YoutubePlayerController youtubePlayerController;
  late Lecture lecture;

  static VideoPlayerCubit get(BuildContext context) {
    return BlocProvider.of<VideoPlayerCubit>(context);
  }

  void setLecture(Lecture lecture) {
    this.lecture = lecture;
    print(this.lecture);
    
  }

  getVideo() {
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: lecture.videoID,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }

  static String getThumbnail(String id) {
    return "http://img.youtube.com/vi/$id/0.jpg";
  }
}
