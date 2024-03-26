import 'package:dartz/dartz.dart';
import 'package:hacker_rank/core/errors/failure.dart';
import 'package:hacker_rank/modules/courses/domin/intits/course.dart';

abstract class BasedCourseRepository {
  Future<Either<Failure, List<CourseEntity>>> getCourse();
}
