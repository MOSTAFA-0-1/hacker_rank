import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_cubit.dart';
import 'package:hacker_rank/core/custom%20variables/custom_var.dart';
import 'package:hacker_rank/core/get_it%20service/service.dart';
import 'package:hacker_rank/core/sizes/screen_size.dart';
import 'package:hacker_rank/core/theme/main_theme.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/file%20cubit/file_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/video%20controller/video_player_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/course_data.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/courses.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/filetest.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/video_player_ui.dart';
import 'package:hacker_rank/modules/home/presentation/cubits/announcement%20cubit/ann_cubit.dart';
import 'package:hacker_rank/modules/home/presentation/screens/home.dart';
import 'package:hacker_rank/modules/sign%20in%20&%20up/screens/sign_in.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ServicesLocator().init();
  CustomVar.initialSharedPref();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RebuildCubit>(
          create: (context) => RebuildCubit(),
        ),
        BlocProvider<CoursesCubit>(
          create: (context) => CoursesCubit(),
        ),
        BlocProvider<VideoPlayerCubit>(
          create: (context) => VideoPlayerCubit(),
        ),
        BlocProvider<FileCubit>(
          create: (context) => FileCubit(),
        ),
          BlocProvider<AnnouncementCubit>(
          create: (context) => AnnouncementCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.mainTheme,
        home: Builder(builder: (context) {
          ScreenSize.getMediaSize(MediaQuery.of(context).size);
          CustomVar.textTheme = Theme.of(context).textTheme;
          return 
          Home();
          // CustomVar.pref.getString("department") == null
          //     ? SignIn()
          //     : Courses();
        }),
      ),
    );
  }
}
