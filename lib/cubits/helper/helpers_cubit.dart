import 'package:bloc/bloc.dart';
import 'package:default_project/data/repositories/helper_repository.dart';
import 'package:meta/meta.dart';

part 'helpers_state.dart';

class HelpersCubit extends Cubit<HelpersState> {
  HelpersCubit({
    required this.helperRepository,
  }) : super(HelpersInitial());

  final HelperRepository helperRepository;


}
