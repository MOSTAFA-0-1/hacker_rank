import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hacker_rank/core/custom%20variables/custom_var.dart';
import 'package:hacker_rank/modules/courses/data/model/dile_model.dart';
import 'package:hacker_rank/modules/courses/domin/intits/file_entity.dart';

import '../../../../core/errors/error_masage_model.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/exceptions/server_exception.dart';

abstract class BasedFilesRemoteDataSource {
  Future<Either<Failure, List<FileEntity>>> getFiles(String id);
}

class FilesRemoteDataSource extends BasedFilesRemoteDataSource {
  
  @override
  Future<Either<Failure, List<FileEntity>>> getFiles(String id) async {
   
    try {
      final List<FileEntity> files = [];
      final docs = await CustomVar.store
          .collection("courses")
          .doc("8xEPrbb1quz2QgcATJIY")
          .collection("files")
          .get();
      docs.docs.map((e) {
        files.add(FileModel.read(e.data()));
      }).toList();
      return Right(files);
    } on FirebaseException catch (ex) {
      throw ServerException(
          errorMassageModel: ErrorMassageModel(massage: ex.message!));
    } catch (e) {
      throw ServerException(
          errorMassageModel: ErrorMassageModel(massage: e.toString()));
    }
  }
}
