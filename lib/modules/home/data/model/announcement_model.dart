import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hacker_rank/modules/home/domin/intits/announcement_entity.dart';

// ignore: must_be_immutable
class AnnouncementModel extends AnnouncementEntity {
  AnnouncementModel(
      {required super.title, required super.url, required super.date});

  factory AnnouncementModel.read(Map<String, dynamic> fireData) {
    return AnnouncementModel(
        title: fireData["title"],
        url: fireData["url"],
        date: (fireData["date"] as Timestamp).toDate());
  }
}
