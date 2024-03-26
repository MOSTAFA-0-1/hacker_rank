import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AnnouncementEntity extends Equatable {
  String url, title ;
  DateTime date;

  AnnouncementEntity(
      {required this.title,
      required this.url,
      required this.date,
      });

  @override
  List<Object?> get props => [
        title,
        url,
        date,
      ];
}
