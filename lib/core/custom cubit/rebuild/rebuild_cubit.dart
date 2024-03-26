import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_rank/core/custom%20cubit/rebuild/rebuild_states.dart';

class RebuildCubit extends Cubit<RebuildStates> {
  RebuildCubit() : super(InitState());

  static RebuildCubit get(BuildContext context) {
    return BlocProvider.of<RebuildCubit>(context);
  }

  rebuild() {
    emit(UpdateState());
  }
}
