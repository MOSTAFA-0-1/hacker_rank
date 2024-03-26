import 'package:equatable/equatable.dart';
import 'package:hacker_rank/core/enums/log_in_enum.dart';

// ignore: must_be_immutable
class LogInCubitStates extends Equatable {
  LogInStates states;
  String errorMassage;

  LogInCubitStates({this.states = LogInStates.initial, this.errorMassage = ""});
  LogInCubitStates copyWith({LogInStates? states, String? errorMassage}) {
    return LogInCubitStates(
        states: states ?? this.states,
        errorMassage: errorMassage ?? this.errorMassage);
  }

  @override
  List<Object?> get props => [states, errorMassage];
}
