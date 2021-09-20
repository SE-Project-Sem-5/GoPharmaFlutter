import 'package:go_pharma/repos/customer/actual/order/product.dart';

class OrderProducts {
  int id;
  int quantity;
  int soldUnitPrice;
  int addedChargePercentage;
  int addedCharge;
  int totalPrice;
  String comment;
  String createdAt;
  String updatedAt;
  int orderID;
  int productID;
  Product product;

  OrderProducts(
      {this.id,
      this.quantity,
      this.soldUnitPrice,
      this.addedChargePercentage,
      this.addedCharge,
      this.totalPrice,
      this.comment,
      this.createdAt,
      this.updatedAt,
      this.orderID,
      this.productID,
      this.product});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    soldUnitPrice = json['soldUnitPrice'];
    addedChargePercentage = json['addedChargePercentage'];
    addedCharge = json['addedCharge'];
    totalPrice = json['totalPrice'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderID = json['orderID'];
    productID = json['productID'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['soldUnitPrice'] = this.soldUnitPrice;
    data['addedChargePercentage'] = this.addedChargePercentage;
    data['addedCharge'] = this.addedCharge;
    data['totalPrice'] = this.totalPrice;
    data['comment'] = this.comment;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['orderID'] = this.orderID;
    data['productID'] = this.productID;
    if (this.product != null) {
      data['Product'] = this.product.toJson();
    }
    return data;
  }
}
