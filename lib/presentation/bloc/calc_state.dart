part of 'calc_bloc.dart';

abstract class CalcState extends Equatable {
  const CalcState();
}

class CalcInitial extends CalcState {
  @override
  List<Object> get props => [];
}

class CharLoaded extends CalcState {
  final String res;
  CharLoaded({required this.res});
  @override
  List<Object> get props => [res];
}

class EqualState extends CalcState {
  final String ans;
  EqualState({required this.ans});
  @override
  List<Object> get props => [ans];
}
