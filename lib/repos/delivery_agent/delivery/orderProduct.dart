import 'product.dart';

class OrderProduct {
  int quantity;
  String status;
  int id;
  int totalPrice;
  Product product;

  OrderProduct({
    this.quantity,
    this.status,
    this.id,
    this.totalPrice,
    this.product,
  });

  OrderProduct.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    status = json['status'];
    id = json['id'];
    totalPrice = json['totalPrice'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['id'] = this.id;
    data['totalPrice'] = this.totalPrice;
    if (this.product != null) {
      data['Product'] = this.product.toJson();
    }
    return data;
  }
}
