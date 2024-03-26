import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FileEntity extends Equatable {
  String title, url;
  FileEntity({required this.title, required this.url});
  @override
  List<Object?> get props => [title,url];
}
