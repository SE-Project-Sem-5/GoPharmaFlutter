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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoriesList != null) {
      data['categoriesList'] =
          this.categoriesList.map((v) => v.toJson()).toList();
    }
    print(data);
    return data;
  }
}
