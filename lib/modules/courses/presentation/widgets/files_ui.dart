import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/file%20cubit/file_cubit.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/file%20cubit/file_states.dart';
import 'package:hacker_rank/modules/courses/presentation/screens/files_list.dart';

// ignore: must_be_immutable
class FilesUi extends StatelessWidget {
  FilesUi({Key? key}) : super(key: key);

  late FileCubit fileCubit;
  @override
  Widget build(BuildContext context) {
    fileCubit = FileCubit.get(context);
    fileCubit.getFiles();
    return BlocBuilder<FileCubit, FileCubitStates>(builder: (context, state) {
      if (fileCubit.files.isEmpty) {
        fileCubit.getFiles();
      }
      return ListView.builder(
        itemCount: fileCubit.files.length,
        itemBuilder: (context, index) {
          return FileListItem(
            file: fileCubit.files[index],
          );
        },
      );
    });
  }
}
