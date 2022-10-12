import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calc_event.dart';
part 'calc_state.dart';

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  CalcBloc() : super(CalcInitial()) {
    on<CalcEvent>((event, emit) {
      if (event is AddCharEvent) {
        emit(CharLoaded(res: event.char));
      }
      if (event is EqualEvent) {
        emit(EqualState(ans: event.ans));
      }
    });
  }
}
