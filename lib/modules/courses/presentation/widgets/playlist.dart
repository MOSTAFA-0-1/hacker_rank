import 'package:flutter/material.dart';
import 'package:hacker_rank/core/transtion/animated_navigation.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/courses%20cubit/courses_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/course_data.dart';

import '../../../../core/custom variables/custom_var.dart';
import '../../../../core/style/boxdecuration_style.dart';

class PlaylistUi extends StatelessWidget {
   PlaylistUi({Key? key,required this.title,required this.subtitle ,required this.url,required this.id}) : super(key: key);
String title,subtitle,url,id;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: circularDecoration(
          radius: 15, color: const Color.fromARGB(135, 70, 69, 69)),
      child: ListTile(
        
        title:  Text(
          title,
          style: const TextStyle(color: Colors.green, fontSize: 17),
        ),
        subtitle: Text(
          subtitle,
          style: CustomVar.textTheme!.headline4,
        ),
        leading: Container(
          height: 50,
          width: 50,
          decoration: circularImageDecoration(
              radius: 10, url: url),
        ),
        trailing: const Icon(
          Icons.play_circle,
          color: Colors.green,
          size: 40,
        ),
        onTap: () {
          CoursesCubit.id = id;
          animatedPush(context, CourseData());
        },
      ),
    );
  }
}
