import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/sizes/screen_size.dart';
import '/core/style/boxdecuration_style.dart';
import '/modules/home/presentation/cubits/announcement%20cubit/ann_cubit.dart';
import '/modules/home/presentation/cubits/announcement%20cubit/ann_cubit_states.dart';

// ignore: must_be_immutable
class AnnouncementUi extends StatelessWidget {
  AnnouncementUi({Key? key}) : super(key: key);

  late AnnouncementCubit cubit;
  @override
  Widget build(BuildContext context) {
    cubit = AnnouncementCubit.get(context);
    cubit.getAnnouncements();
    return SizedBox(
      height: ScreenSize.height,
      child: BlocBuilder<AnnouncementCubit, AnnouncementCubitStates>(
          builder: (context, state) {
        return ListView.builder(
          itemCount: cubit.announcements.length,
          itemBuilder: (context, index) => SizedBox(
            height: 430,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  child: ListTile(
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: circularImageDecoration(
                          radius: 30, url: "assets/images/logo.jpg"),
                    ),
                    title: Text(cubit.announcements[index].title),
                    subtitle:  Text(cubit.announcements[index].date.day.toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 270,
                    width: ScreenSize.width * .9,
                    child: Image.network(cubit.announcements[index].url),
                  ),
                ),
                const Divider(
                  thickness: 3,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
