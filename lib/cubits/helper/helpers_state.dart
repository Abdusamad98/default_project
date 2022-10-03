part of 'helpers_cubit.dart';

@immutable
abstract class HelpersState {}

class HelpersInitial extends HelpersState {}

//--------------------Languages-------------------
class GetLanguagesInProgress extends HelpersState {}

class GetLanguagesInSuccess extends HelpersState {
  GetLanguagesInSuccess({required this.languages});

  final List<HelperModel> languages;
}

class GetLanguagesInFailure extends HelpersState {
  GetLanguagesInFailure({required this.errorText});

  final String errorText;
}

//--------------------Genres-------------------
class GetGenresInProgress extends HelpersState {}

class GetGenresInSuccess extends HelpersState {
  GetGenresInSuccess({required this.genres});

  final List<HelperModel> genres;
}

class GetGenresInFailure extends HelpersState {
  GetGenresInFailure({required this.errorText});

  final String errorText;
}
