import 'package:go_pharma/repos/delivery_agent/product/product_model.dart';

class Delivery {
  String destination;
  List<Product> products;
  double totalPrice;
  String deliveryStatus;

  Delivery({
    required this.destination,
    required this.products,
    required this.totalPrice,
    required this.deliveryStatus,
  });
}
