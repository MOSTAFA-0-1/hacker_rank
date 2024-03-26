import 'package:dartz/dartz.dart';
import 'package:hacker_rank/modules/home/domin/intits/announcement_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class BasedAnnouncementRepository {
  Future<Either<Failure, List<AnnouncementEntity>>> getAnnouncements();
}
