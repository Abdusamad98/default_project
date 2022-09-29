import 'package:bloc/bloc.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:default_project/data/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';


class UserCubit extends Cubit<UserState> {
  UserCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserInitial());

  final UserRepository _userRepository;

  Future<void> fetchUsers() async {
    emit(UsersGetInProgress());
    try {
      var users = await _userRepository.getUsers();
      emit(UsersGetInSuccess(users: users));
    } catch (error) {
      emit(UsersGetInFailure(errorText: error.toString()));
    }
  }
  Future<void> updateUsers() async {
    emit(UsersUpdateInProgress());
    try {
      var users = await _userRepository.getUsers();
      emit(UsersUpdateInSuccess(isUserUpdated:true));
    } catch (error) {
      emit(UsersUpdateInFailure(errorText: error.toString()));
    }
  }
}
