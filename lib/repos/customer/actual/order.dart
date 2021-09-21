import 'package:go_pharma/repos/customer/actual/addressDetails.dart';
import 'package:go_pharma/repos/customer/actual/orderProduct.dart';

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
  AddressDetail addressDetail;

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
      this.orderProducts,
      this.addressDetail});

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
    addressDetail = json['AddressDetail'] != null
        ? new AddressDetail.fromJson(json['AddressDetail'])
        : null;
  }
}
