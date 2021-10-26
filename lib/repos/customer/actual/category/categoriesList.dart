import 'package:go_pharma/repos/customer/actual/category/category.dart';

class CategoriesList {
  List<Category> categoriesList;

  CategoriesList({this.categoriesList});

  CategoriesList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      categoriesList = [];
      json['data'].forEach((v) {
        categoriesList.add(new Category.fromJson(v));
      });
    }
  }
}
