import 'package:dartz/dartz.dart';
import 'package:hacker_rank/modules/home/domin/repository/based_announcement_repo.dart';

import '../../../../core/errors/failure.dart';
import '../intits/announcement_entity.dart';

class GetAnnouncements {
  BasedAnnouncementRepository basedAnnouncementRepository;
  GetAnnouncements({required this.basedAnnouncementRepository,  });
  Future<Either<Failure, List<AnnouncementEntity>>> execute() {
    return basedAnnouncementRepository.getAnnouncements();
  }
}
