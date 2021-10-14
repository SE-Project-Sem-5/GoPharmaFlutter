import 'package:go_pharma/repos/delivery_agent/product/product_model.dart';

//TODO:skip the paid state if the orderInProgress has been paid for online
List<String> deliveryStates = [
  "confirmed",
  "collected",
  "transient",
  "shipped",
  "delivered",
];
