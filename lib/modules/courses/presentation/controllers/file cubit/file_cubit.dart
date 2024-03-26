import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/get_it%20service/service.dart';
import 'package:hacker_rank/modules/courses/domin/intits/file_entity.dart';
import 'package:hacker_rank/modules/courses/presentation/controllers/file%20cubit/file_states.dart';

import '../../../domin/usecase/get_files.dart';

class FileCubit extends Cubit<FileCubitStates> {
  FileCubit() : super(IntitFileState());

  static FileCubit get(BuildContext context) {
    return BlocProvider.of<FileCubit>(context);
  }

  List<FileEntity> files = [];
  String id = "";

  getFiles() async {
    final response = await sl<GetFiles>().execute(id);
    response.fold((l) => null, (r) {
      files = r;
    });
    emit(GetFileState());
  }
}
