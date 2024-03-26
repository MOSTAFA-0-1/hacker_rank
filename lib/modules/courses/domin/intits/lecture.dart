import 'package:equatable/equatable.dart';

class Lecture extends Equatable{
  String title,videoID,thumbnailUrl;
  Lecture({required this.title ,required this.videoID,required this.thumbnailUrl});
  
  @override
  List<Object?> get props => [title,videoID,thumbnailUrl];

}