import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_cubit.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_states.dart';
import 'package:hacker_rank/core/sizes/screen_size.dart';
import 'package:hacker_rank/core/style/boxdecuration_style.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/files_ui.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/tabbar_item.dart';
import 'package:hacker_rank/modules/courses/presentation/widgets/videos.dart';

// ignore: must_be_immutable
class CourseData extends StatelessWidget {
  CourseData({Key? key}) : super(key: key);

  int currentIndex = 0;
  late RebuildCubit cubit;
  late CoursesCubit courseCubit;

  @override
  Widget build(BuildContext context) {
    cubit = RebuildCubit.get(context);
    courseCubit = CoursesCubit.get(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            height: ScreenSize.height,
            padding: const EdgeInsets.all(13),
            margin: const EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff292C31),
              Color(0xff09090A),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Column(
              children: [
                Container(
                  height: 300,
                  margin: const EdgeInsets.all(20),
                  decoration: circularImageDecoration(
                      radius: 10, url: "assets/images/java_image.png"),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: BlocBuilder<RebuildCubit, RebuildStates>(
                          builder: (context, state) {
                        return SizedBox(
                          height: 70,
                          child: TabBar(
                            dividerHeight: 0,
                            tabs: [
                              Tab(
                                child: TabBarButton(
                                    title: "Play",
                                    radius: 10,
                                    function: () {
                                      currentIndex = 0;
                                      DefaultTabController.of(context)!
                                          .animateTo(0);

                                      cubit.rebuild();
                                    },
                                    isSelected: currentIndex == 0),
                              ),
                              Tab(
                                child: TabBarButton(
                                    title: "Material",
                                    radius: 10,
                                    function: () {
                                      currentIndex = 1;
                                      DefaultTabController.of(context)!
                                          .animateTo(1);
                                      cubit.rebuild();
                                    },
                                    isSelected: currentIndex == 1),
                              ),
                            ],
                            indicatorColor: Colors.green,
                            automaticIndicatorColorAdjustment: true,
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: SizedBox(
                        height: 250,
                        child: TabBarView(children: [Videos(), FilesUi()]),
                      ),
                    ),
                  ],
                )
              ],
            )),
      )),
    );
  }
}
