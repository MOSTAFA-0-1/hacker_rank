import 'package:flutter/material.dart';
import 'package:hacker_rank/core/theme/main_theme.dart';
import 'package:hacker_rank/modules/courses/domin/intits/file_entity.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class FileListItem extends StatelessWidget {
  FileListItem({Key? key, required this.file}) : super(key: key);
  FileEntity file;


void openWith(String fileUrl) async {
  if (await canLaunch(fileUrl)) {
    await launch(fileUrl);
  } else {
    throw 'Could not launch $fileUrl';
  }
}

// Usage
String fileUrl = "https://example.com/path/to/file.txt";
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        const url =
            'https://southbend.iu.edu/students/academic-success-programs/academic-centers-for-excellence/docs/Basic%20Math%20Review%20Card.pdf';

        print("object");
        openWith(url);
      },
      title: Text(
        file.title,
        style: MainTheme.mainTheme.textTheme.headline2,
      ),
      leading: const Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.download,
            color: Colors.green,
          )),
    );
  }
}
