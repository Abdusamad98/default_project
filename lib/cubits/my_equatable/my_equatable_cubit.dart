import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_equatable_state.dart';

class MyEquatableCubit extends Cubit<MyEquatableState> {
  MyEquatableCubit() : super(MyEquatableState(name:""));
}
