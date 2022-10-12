part of 'calc_bloc.dart';

abstract class CalcEvent extends Equatable {
  const CalcEvent();
}

class AddCharEvent extends CalcEvent {
  String char;
  AddCharEvent({required this.char});
  @override
  List<Object?> get props => [char];
}

class EqualEvent extends CalcEvent {
  String ans;
  EqualEvent({required this.ans});
  @override
  List<Object?> get props => [ans];
}
