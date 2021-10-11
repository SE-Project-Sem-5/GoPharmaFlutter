import 'package:go_pharma/repos/customer/actual/product/product.dart';

class ProductList {
  List<Product> products;

  ProductList({this.products});

  ProductList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['data'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
