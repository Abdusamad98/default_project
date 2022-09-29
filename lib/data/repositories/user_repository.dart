import 'package:default_project/data/models/user_model.dart';
import 'package:default_project/data/services/api_provider.dart';

class UserRepository {
  UserRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<UserModel>> getUsers() async => apiProvider.getUsersList();
}
