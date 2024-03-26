import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hacker_rank/core/custom%20variables/custom_var.dart';
import 'package:hacker_rank/modules/courses/data/model/course_model.dart';

import '../../../../core/errors/failure.dart';
import '../../domin/intits/course.dart';

abstract class BasedCourseRemoteDataSource {
  Future<Either<Failure, List<CourseEntity>>> getCourse();
}

class CourseRemoteDataSource extends BasedCourseRemoteDataSource {
  List<CourseEntity> courses = [];
  @override
  Future<Either<Failure, List<CourseEntity>>> getCourse() async {
    try {
      String department = CustomVar.pref.getString("department") ?? "courses";
      courses.clear();
      final docs = await CustomVar.store.collection(department).get();

      docs.docs.map((e) {
        courses.add(CourseModel.read(e.data(), e.id));
      }).toList();

      // print(" sssssssssssssssssssssssss ${courses.length}");
      return Right(courses);
    } on FirebaseException catch (firebaseException) {
      return Left(ServerFailure(firebaseException.message!));
    } catch (error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}
