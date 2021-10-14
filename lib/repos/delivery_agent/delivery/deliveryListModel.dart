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
}
