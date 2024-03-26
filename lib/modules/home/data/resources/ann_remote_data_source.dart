import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hacker_rank/modules/home/data/model/announcement_model.dart';

import '../../../../core/custom variables/custom_var.dart';
import '../../../../core/errors/error_masage_model.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/exceptions/server_exception.dart';
import '../../domin/intits/announcement_entity.dart';

abstract class BasedAnnouncementRemoteDataSource {
  Future<Either<Failure, List<AnnouncementEntity>>> getAnnouncements();
}

class AnnouncementRemoteDataSource extends BasedAnnouncementRemoteDataSource {
  List<AnnouncementEntity> announcements = [];
  @override
  Future<Either<Failure, List<AnnouncementEntity>>> getAnnouncements() async {
    try {
      announcements.clear();
      final docs = await CustomVar.store.collection("announcments").get();

      docs.docs.map((e) {
        announcements.add(AnnouncementModel.read(e.data()));
      }).toList();

      return Right(announcements);
    } on FirebaseException catch (firebaseException) {
      throw ServerException(
          errorMassageModel:
              ErrorMassageModel(massage: firebaseException.message!));
    } catch (error) {
      throw ServerException(
          errorMassageModel: ErrorMassageModel(massage: error.toString()));
    }
  }
}
