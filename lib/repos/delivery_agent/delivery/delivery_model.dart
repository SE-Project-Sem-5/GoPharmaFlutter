import 'package:go_pharma/repos/delivery_agent/product/product_model.dart';

//TODO:skip the paid state if the order has been paid for online
List<String> deliveryStates = [
  "confirmed",
  "collected",
  "transient",
  "shipped",
  "delivered",
];

class Delivery {
  String id;
  String destination;
  List<Product> products;
  double totalPrice;
  String deliveryStatus;
  double deliveryCharge;
  int deliveryStatusIndex;

  Delivery({
    this.id,
    this.destination,
    this.products,
    this.deliveryStatus,
    this.totalPrice,
    this.deliveryCharge,
  }) {
    deliveryStatusIndex = deliveryStates.indexOf(deliveryStatus);
  }

  nextDeliveryStatus() {
    if (deliveryStatusIndex < deliveryStates.length - 1) {
      deliveryStatusIndex += 1;
    }
    deliveryStatus = deliveryStates[deliveryStatusIndex];
    print(deliveryStatus);
  }
}
