import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/category/categoriesList.dart';

class CategoryAPIProvider {
  final Dio _dio = Client.init();

  Future<CategoriesList> getAllCategories() async {
    try {
      Response response = await _dio.post("information/categories");
      print(response.data);
      return CategoriesList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CategoriesList();
    }
  }
}
