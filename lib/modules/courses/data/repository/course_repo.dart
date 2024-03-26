import 'package:hacker_rank/modules/courses/domin/intits/course.dart';
import 'package:hacker_rank/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hacker_rank/modules/courses/domin/repository/based_course_repository.dart';

import '../resources/remote_data_source.dart';

class CourseRepository extends BasedCourseRepository {
  BasedCourseRemoteDataSource basedCourseRemoteDataSource;

  CourseRepository({required this.basedCourseRemoteDataSource});

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourse() {
    return basedCourseRemoteDataSource.getCourse();
  }
}
