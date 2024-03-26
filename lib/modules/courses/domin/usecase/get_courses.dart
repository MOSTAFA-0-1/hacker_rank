import 'package:dartz/dartz.dart';
import 'package:hacker_rank/modules/courses/domin/repository/based_course_repository.dart';

import '../../../../core/errors/failure.dart';
import '../intits/course.dart';

class GetCourses {
  BasedCourseRepository basedCourseRepository;
  GetCourses({required this.basedCourseRepository});

  Future<Either<Failure, List<CourseEntity>>> excute() {
    return basedCourseRepository.getCourse();
  }
}
