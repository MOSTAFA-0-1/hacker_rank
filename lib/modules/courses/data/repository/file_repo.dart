import 'package:hacker_rank/modules/courses/data/resources/files_firebase_source.dart';
import 'package:hacker_rank/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hacker_rank/modules/courses/domin/intits/file_entity.dart';
import 'package:hacker_rank/modules/courses/domin/repository/based_files_repo.dart';


class FileRepository extends BasedFileRepository {
  BasedFilesRemoteDataSource basedFileRemoteDataSource;

  FileRepository({required this.basedFileRemoteDataSource});

  @override
  Future<Either<Failure, List<FileEntity>>> getFiles(String id) {
    return basedFileRemoteDataSource.getFiles(id);
  }
}
