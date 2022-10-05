part of 'test_bloc.dart';

@immutable
abstract class TestEvent {}

class ValidateMyPhoneInputEvent extends TestEvent{
  ValidateMyPhoneInputEvent({required this.text});
  final String text;
}

class OtherTestEvent extends TestEvent{}
