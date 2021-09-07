import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/product/product_model.dart';
import 'package:go_pharma/ui/common/colors.dart';

List<String> deliveryStates = [
  "Scheduled",
  "In Transit",
  "Delivered",
  "Paid",
];

Map<String, Color> deliveryStatusColorMapping = {
  deliveryStates[0]: GoPharmaColors.PrimaryColor.withOpacity(0.2),
  deliveryStates[1]: Colors.blueAccent.withOpacity(0.2),
  deliveryStates[2]: Colors.green.withOpacity(0.2),
};

class Delivery {
  String destination;
  List<Product> products;
  double totalPrice;
  String deliveryStatus;
  double deliveryCharge;
  late int deliveryStatusIndex;

  Delivery({
    required this.destination,
    required this.products,
    required this.deliveryStatus,
    required this.totalPrice,
    required this.deliveryCharge,
  }) {
    deliveryStatusIndex = deliveryStates.indexOf(deliveryStatus);
  }

  nextDeliveryStatus() {
    if (deliveryStatusIndex < deliveryStates.length - 1) {
      deliveryStatusIndex += 1;
    }
  }

  previousDeliveryStatus() {
    if (deliveryStatusIndex >= 0) {
      deliveryStatusIndex -= 1;
    }
  }
}
