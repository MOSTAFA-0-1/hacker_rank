import 'package:get_it/get_it.dart';
import 'package:hacker_rank/modules/courses/data/repository/course_repo.dart';
import 'package:hacker_rank/modules/courses/data/repository/file_repo.dart';
import 'package:hacker_rank/modules/courses/data/resources/files_firebase_source.dart';
import 'package:hacker_rank/modules/courses/data/resources/remote_data_source.dart';
import 'package:hacker_rank/modules/courses/domin/repository/based_course_repository.dart';
import 'package:hacker_rank/modules/courses/domin/repository/based_files_repo.dart';
import 'package:hacker_rank/modules/courses/domin/usecase/get_courses.dart';
import 'package:hacker_rank/modules/courses/domin/usecase/get_files.dart';
import 'package:hacker_rank/modules/home/data/repository/ann_repo.dart';
import 'package:hacker_rank/modules/home/data/resources/ann_remote_data_source.dart';
import 'package:hacker_rank/modules/home/domin/repository/based_announcement_repo.dart';
import 'package:hacker_rank/modules/home/domin/usecase/get_announcements.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // cubits

    // get Courses
    sl.registerLazySingleton<BasedCourseRemoteDataSource>(
        () => CourseRemoteDataSource());
    sl.registerLazySingleton<BasedCourseRepository>(
        () => CourseRepository(basedCourseRemoteDataSource: sl()));
    sl.registerLazySingleton<GetCourses>(
        () => GetCourses(basedCourseRepository: sl()));

    // get files
    sl.registerLazySingleton<BasedFilesRemoteDataSource>(
        () => FilesRemoteDataSource());
    sl.registerLazySingleton<BasedFileRepository>(
        () => FileRepository(basedFileRemoteDataSource: sl()));
    sl.registerLazySingleton<GetFiles>(
        () => GetFiles(basedFileRepository: sl()));

    // get Announcements
    sl.registerLazySingleton<BasedAnnouncementRemoteDataSource>(
        () => AnnouncementRemoteDataSource());
    sl.registerLazySingleton<BasedAnnouncementRepository>(
        () => AnnouncementRepository(announcementRemoteDataSource: sl()));
    sl.registerLazySingleton<GetAnnouncements>(() => GetAnnouncements(
          basedAnnouncementRepository: sl(),
        ));
  }
}
