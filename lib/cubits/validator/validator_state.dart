part of 'validator_cubit.dart';

@immutable
abstract class ValidatorState {}

class ValidatorInitial extends ValidatorState {}

class ValidatePhoneInput extends ValidatorState {
  ValidatePhoneInput({required this.validatedText});

  final String validatedText;
}
