import 'package:dartz/dartz.dart';
import 'package:hacker_rank/modules/courses/domin/intits/file_entity.dart';
import 'package:hacker_rank/modules/courses/domin/repository/based_files_repo.dart';

import '../../../../core/errors/failure.dart';

class GetFiles {
  BasedFileRepository basedFileRepository;
  GetFiles({required this.basedFileRepository});

  Future<Either<Failure, List<FileEntity>>> execute(String id) {
    return basedFileRepository.getFiles(id);
  }
}
