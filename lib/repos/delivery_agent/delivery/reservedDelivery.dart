import 'orderProduct.dart';

class ReservedDeliveryList {
  List<ReservedDelivery> reservedDelivery;

  ReservedDeliveryList({this.reservedDelivery});

  ReservedDeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['reservedDelivery'] != null) {
      reservedDelivery = [];
      json['reservedDelivery'].forEach((v) {
        reservedDelivery.add(new ReservedDelivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reservedDelivery != null) {
      data['reservedDelivery'] =
          this.reservedDelivery.map((v) => v.toJson()).toList();
    }
    return data;
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
