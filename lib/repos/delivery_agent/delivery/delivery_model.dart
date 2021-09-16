import 'package:go_pharma/repos/delivery_agent/product/product_model.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_states.dart';

//TODO:skip the paid state if the order has been paid for online

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
  }

  previousDeliveryStatus() {
    if (deliveryStatusIndex > 0) {
      deliveryStatusIndex -= 1;
    }
    deliveryStatus = deliveryStates[deliveryStatusIndex];
    print(deliveryStatus);
  }
}
