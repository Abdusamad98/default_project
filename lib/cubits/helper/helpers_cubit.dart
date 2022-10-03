import 'package:bloc/bloc.dart';
import 'package:default_project/data/models/helper/helper_model.dart';
import 'package:default_project/data/repositories/helper_repository.dart';
import 'package:meta/meta.dart';

part 'helpers_state.dart';

class HelpersCubit extends Cubit<HelpersState> {
  HelpersCubit({
    required this.helperRepository,
  }) : super(HelpersInitial());

  final HelperRepository helperRepository;

  void getLanguages() async {
    emit(GetLanguagesInProgress());
    try {
      var languages = await helperRepository.getLanguages();
      emit(GetLanguagesInSuccess(languages: languages));
    } catch (error) {
      emit(GetLanguagesInFailure(errorText: error.toString()));
    }
  }

  void getGenres() async {
    emit(GetGenresInProgress());
    try {
      var genres = await helperRepository.getLanguages();
      emit(GetGenresInSuccess(genres: genres));
    } catch (error) {
      emit(GetGenresInFailure(errorText: error.toString()));
    }
  }
}
