part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

//-----------------Get Users -----------------
class UsersGetInProgress extends UserState {}

class UsersGetInSuccess extends UserState {
  UsersGetInSuccess({required this.users});

  final List<UserModel> users;
}

class UsersGetInFailure extends UserState {
  UsersGetInFailure({required this.errorText});

  final String errorText;
}

//-----------------Update User -----------------

class UsersUpdateInProgress extends UserState {}
class UsersUpdateInSuccess extends UserState {
  UsersUpdateInSuccess({required this.isUserUpdated});

  final bool isUserUpdated;
}
class UsersUpdateInFailure extends UserState {
  UsersUpdateInFailure({required this.errorText});

  final String errorText;
}
