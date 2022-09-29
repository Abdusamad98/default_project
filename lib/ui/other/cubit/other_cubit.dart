import 'package:flutter_bloc/flutter_bloc.dart';

class OtherCubit extends Cubit<int> {
  OtherCubit() : super(0); //state = 0;

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}