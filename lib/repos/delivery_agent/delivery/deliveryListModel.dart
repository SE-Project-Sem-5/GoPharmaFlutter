import 'orderProduct.dart';

class PendingDeliveryList {
  List<OrderProduct> deliveries;

  PendingDeliveryList({this.deliveries});

  PendingDeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new OrderProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveries != null) {
      data['delivery'] = this.deliveries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
