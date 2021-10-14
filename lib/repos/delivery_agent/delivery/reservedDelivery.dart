import 'orderProduct.dart';

class ReservedDeliveryList {
  List<ReservedDelivery> deliveries;

  ReservedDeliveryList({this.deliveries});

  ReservedDeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new ReservedDelivery.fromJson(v));
      });
    }
  }
}

class ReservedDelivery {
  int orderID;
  int id;
  OrderProduct orderProduct;

  ReservedDelivery({this.orderID, this.id, this.orderProduct});

  ReservedDelivery.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    id = json['id'];
    orderProduct = json['OrderProduct'] != null
        ? new OrderProduct.fromJson(json['OrderProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderID'] = this.orderID;
    data['id'] = this.id;
    if (this.orderProduct != null) {
      data['OrderProduct'] = this.orderProduct.toJson();
    }
    return data;
  }
}
