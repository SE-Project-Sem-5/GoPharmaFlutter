import 'package:go_pharma/repos/customer/dummy/order/current_order_model.dart';

List<CurrentOrder> currentOrders = [
  new CurrentOrder(
    orderId: "#abcd1234",
    price: 500.00,
    orderedDate: DateTime.now(),
    status: "Processing",
  ),
  new CurrentOrder(
    orderId: "#abcd2345",
    price: 500.00,
    orderedDate: DateTime.now(),
    status: "Packing",
  ),
  new CurrentOrder(
    orderId: "#abcd3456",
    price: 1000.00,
    orderedDate: DateTime.now(),
    status: "Delivered",
  ),
  new CurrentOrder(
    orderId: "#abcd3456",
    price: 1000.00,
    orderedDate: DateTime.now(),
    status: "In Transit",
  ),
];
