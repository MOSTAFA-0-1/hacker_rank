import 'package:flutter/material.dart';
import '/modules/courses/presentation/screens/courses.dart';
import '/modules/home/presentation/widgets/announcement_ui.dart';
import '/modules/sign%20in%20&%20up/widgets/radius_button.dart';

import '../../../../core/style/boxdecuration_style.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
            width: 40,
            height: 40,
            decoration: circularImageDecoration(
                radius: 0, url: "assets/images/logo.jpg"),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: RadiusButton(
                text: "Courses",
                radius: 10,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Courses(),
                      ));
                },
                borderColor: Colors.green,
                backgroundColor: const Color(0xff292C31),
              ),
            )
          ],
          bottom: const TabBar(
            labelColor: Colors.green,
            indicatorColor: Colors.green,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Contact Us",
              ),
              Tab(
                text: "About Us",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AnnouncementUi(),
            const Center(
              child: Text("It's rainy here"),
            ),
            const Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
