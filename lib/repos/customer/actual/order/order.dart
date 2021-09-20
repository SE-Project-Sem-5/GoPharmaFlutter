import 'package:go_pharma/repos/customer/actual/order/order_product.dart';

class Order {
  int id;
  String orderedDate;
  int totalPrice;
  String createdAt;
  String updatedAt;
  String orderType;
  int deliveryCharge;
  int destinationAddressID;
  int customer;
  List<OrderProducts> orderProducts;

  Order(
      {this.id,
      this.orderedDate,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.orderType,
      this.deliveryCharge,
      this.destinationAddressID,
      this.customer,
      this.orderProducts});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderedDate = json['orderedDate'];
    totalPrice = json['totalPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderType = json['orderType'];
    deliveryCharge = json['deliveryCharge'];
    destinationAddressID = json['destinationAddressID'];
    customer = json['customer'];
    if (json['OrderProducts'] != null) {
      orderProducts = [];
      json['OrderProducts'].forEach((v) {
        orderProducts.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderedDate'] = this.orderedDate;
    data['totalPrice'] = this.totalPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['orderType'] = this.orderType;
    data['deliveryCharge'] = this.deliveryCharge;
    data['destinationAddressID'] = this.destinationAddressID;
    data['customer'] = this.customer;
    if (this.orderProducts != null) {
      data['OrderProducts'] =
          this.orderProducts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
