import 'package:go_pharma/repos/customer/order/current_order_model.dart';

List<CurrentOrder> currentOrders = [
  new CurrentOrder(
    order_id: "#abcd1234",
    price: 500.00,
    orderedDate: DateTime.now(),
    status: "Processing",
  ),
  new CurrentOrder(
    order_id: "#abcd2345",
    price: 500.00,
    orderedDate: DateTime.now(),
    status: "Packing",
  ),
  new CurrentOrder(
    order_id: "#abcd3456",
    price: 1000.00,
    orderedDate: DateTime.now(),
    status: "Delivered",
  ),
  new CurrentOrder(
    order_id: "#abcd3456",
    price: 1000.00,
    orderedDate: DateTime.now(),
    status: "In Transit",
  ),
];
