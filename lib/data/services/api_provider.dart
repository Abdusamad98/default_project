import 'package:default_project/data/models/user_model.dart';
import 'package:default_project/data/services/api_client.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

  Future<List<UserModel>> getUsersList() async {
    Response response =
        await apiClient.dio.get("https://jsonplaceholder.typicode.com/users");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return (response.data as List?)
              ?.map((item) => UserModel.fromJson(item))
              .toList() ??
          [];
    } else {
      throw Exception();
    }
  }
}
