import 'package:hacker_rank/modules/courses/domin/intits/lecture.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/video%20controller/video_player_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class LectureModel extends Lecture {
  LectureModel(
      {required super.title,
      required super.videoID,
      required super.thumbnailUrl});

  factory LectureModel.read(Map<String, dynamic> fireData) {
    final id = YoutubePlayer.convertUrlToId(fireData["video_url"]) ?? "";
    return LectureModel(
        title: fireData["title"],
        videoID: id,
        thumbnailUrl: id.isEmpty ? "" : VideoPlayerCubit.getThumbnail(id));
  }
}
