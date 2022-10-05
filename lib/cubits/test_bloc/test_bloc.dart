import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_event.dart';

part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitial()) {
    on<ValidateMyPhoneInputEvent>(validate);
    on<OtherTestEvent>(otherMethod);
  }

  void validate(ValidateMyPhoneInputEvent event, Emitter<TestState> emit) {
    emit(ValidatePhoneInputState(validatedText: event.text));
  }

  void otherMethod(OtherTestEvent otherTestEvent, Emitter<TestState> emit) {
    emit(OtherTestState());
  }

}
