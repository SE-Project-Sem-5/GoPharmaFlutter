import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';

class SearchAPIProvider {
  final Dio _dio = Client.init();

  Future<ProductList> searchProducts(String filter, String searchValue) async {
    try {
      Response response = await _dio.get(
        "customer/order/search?$filter=$searchValue",
      );
      print(response);
      return ProductList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductList();
    }
  }
}
