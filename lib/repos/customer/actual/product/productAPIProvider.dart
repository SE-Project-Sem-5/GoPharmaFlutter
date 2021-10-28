import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';

class ProductAPIProvider {
  final Dio _dio = Client.init();

  Future<ProductList> getAllProducts(String category) async {
    try {
      Response response = await _dio.post(
        "information/category/product",
        data: {"category": category},
      );
      print(response);
      return ProductList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductList();
    }
  }
}
