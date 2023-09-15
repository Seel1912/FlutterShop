import 'package:dio/dio.dart';
import 'package:product_app/models/product.dart';

class ProductServices {
  final dio = Dio();

  Future<List<Product>> getProductsFromApi() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');
      List<Product> products = [];
      List<dynamic>.from(response.data).forEach((item) {
        Product p = Product.fromJson(item);
        products.add(p);
      });
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
