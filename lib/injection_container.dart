import 'package:get_it/get_it.dart';
import 'package:ios_calculator_clone/presentation/bloc/calc_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CalcBloc());
}
