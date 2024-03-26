import 'package:dartz/dartz.dart';
import 'package:hacker_rank/core/errors/failure.dart';
import 'package:hacker_rank/modules/courses/domin/intits/file_entity.dart';

abstract class BasedFileRepository {
  Future<Either<Failure, List<FileEntity>>> getFiles(String id);
}
