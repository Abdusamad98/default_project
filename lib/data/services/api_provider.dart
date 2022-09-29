import 'package:default_project/data/models/product_item.dart';
import 'package:default_project/data/services/api_client.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final ApiClient apiClient;

  ApiProvider({required this.apiClient});

  Future<List<ProductItem>> getProducts() async {
    Response response =
        await apiClient.dio.get("${apiClient.dio.options.baseUrl}products");

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      List<ProductItem> products = (response.data["data"] as List?)
              ?.map((productMap) => ProductItem.fromJson(productMap))
              .toList() ??
          [];
      return products;
    } else {
      throw Exception();
    }
  }

  Future<bool> addProduct({
    required String productName,
    required int productId,
  }) async {
    Response response = await apiClient.dio
        .post("${apiClient.dio.options.baseUrl}products", data: {
      "data": {
        "name": productName,
        "product_id": productId,
      }
    });

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      bool isAdded = response.data["data"]["attributes"]["product_id"] == productId;
      return isAdded;
    } else {
      throw Exception();
    }
  }
}
