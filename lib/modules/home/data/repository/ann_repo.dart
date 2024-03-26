import 'package:hacker_rank/modules/home/data/resources/ann_remote_data_source.dart';
import 'package:hacker_rank/modules/home/domin/intits/announcement_entity.dart';
import 'package:hacker_rank/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hacker_rank/modules/home/domin/repository/based_announcement_repo.dart';

class AnnouncementRepository extends BasedAnnouncementRepository {
  BasedAnnouncementRemoteDataSource announcementRemoteDataSource;
  AnnouncementRepository({required this.announcementRemoteDataSource});
  @override
  Future<Either<Failure, List<AnnouncementEntity>>> getAnnouncements() {
    return announcementRemoteDataSource.getAnnouncements();
  }
}
