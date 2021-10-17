import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/category/categoriesList.dart';

class CategoryAPIProvider {
  //TODO:Ensure that both the device and hosting site are connected to the same network
  final Dio _dio = Client.init();

  Future<CategoriesList> getAllCategories() async {
    try {
      Response response = await _dio.post("information/categories");
      return CategoriesList.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CategoriesList();
    }
  }
}
