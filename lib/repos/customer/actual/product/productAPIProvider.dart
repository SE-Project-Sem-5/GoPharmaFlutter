import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';

class ProductAPIProvider {
  //TODO:Ensure that both the device and hosting site are connected to the same network
  final Dio _dio = Client.init();

  Future<ProductList> getAllProducts(String category) async {
    try {
      Response response = await _dio.post(
        "customer/category/product",
        data: {"category": category},
      );
      print(response);
      return ProductList.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductList();
    }
  }
}
