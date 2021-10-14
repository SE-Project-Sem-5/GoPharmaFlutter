import 'supplier.dart';

class Product {
  String productName;
  String brandName;
  Supplier supplier;

  Product({
    this.productName,
    this.brandName,
    this.supplier,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    brandName = json['brandName'];
    supplier = json['Supplier'] != null
        ? new Supplier.fromJson(json['Supplier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['brandName'] = this.brandName;
    if (this.supplier != null) {
      data['Supplier'] = this.supplier.toJson();
    }
    return data;
  }
}
