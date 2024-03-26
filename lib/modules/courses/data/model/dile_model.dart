import 'package:hacker_rank/modules/courses/domin/intits/file_entity.dart';

// ignore: must_be_immutable
class FileModel extends FileEntity {
  FileModel({required super.title, required super.url});
  factory FileModel.read(Map<String, dynamic> fireData) {
    return FileModel(title: fireData["title"], url: fireData["url"]);
  }
}
