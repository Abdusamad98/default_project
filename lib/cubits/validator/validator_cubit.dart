import 'package:bloc/bloc.dart';
import 'package:default_project/data/repositories/test_repository.dart';
import 'package:meta/meta.dart';

part 'validator_state.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  ValidatorCubit({required this.testRepository}) : super(ValidatorInitial());

  final TestRepository testRepository;

  void validateMyPhoneInput(String text) {
    emit(ValidatePhoneInput(validatedText: text));
  }
}
