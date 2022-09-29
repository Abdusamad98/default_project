import 'package:default_project/data/models/product_item.dart';
import 'package:default_project/data/services/api_provider.dart';

class ProductsRepository {
  ProductsRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<ProductItem>> getAllProducts() => apiProvider.getProducts();

  Future<bool> addProduct({
    required String productName,
    required int productId,
  }) =>
      apiProvider.addProduct(productName: productName, productId: productId);
}
