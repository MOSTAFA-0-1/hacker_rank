import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/get_it%20service/service.dart';
import 'package:hacker_rank/modules/home/domin/usecase/get_announcements.dart';
import 'package:hacker_rank/modules/home/presentation/cubits/announcement%20cubit/ann_cubit_states.dart';

import '../../../domin/intits/announcement_entity.dart';

class AnnouncementCubit extends Cubit<AnnouncementCubitStates> {
  AnnouncementCubit() : super(AnnouncementsInitState());

  static AnnouncementCubit get(BuildContext context) {
    return BlocProvider.of<AnnouncementCubit>(context);
  }

  List<AnnouncementEntity> announcements = [];
  void getAnnouncements() async {
    final response = await sl<GetAnnouncements>().execute();
    response.fold((l) => null, (r) {
      announcements = r;
      emit(UpdateAnnouncements());
    });
  }
}
