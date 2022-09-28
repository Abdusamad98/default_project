import 'package:default_project/data/services/api_client.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

  Future<void> getData() async {
    Response response =
        await apiClient.dio.get("${apiClient.dio.options.baseUrl}endPoint");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
    } else {
      throw Exception();
    }
  }
}
