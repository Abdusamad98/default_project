part of 'test_bloc.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class ValidatePhoneInputState extends TestState {
  ValidatePhoneInputState({required this.validatedText});

  final String validatedText;
}

class OtherTestState extends TestState{}
