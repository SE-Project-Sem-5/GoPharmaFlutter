class CurrentOrder {
  final String orderId;
  final DateTime orderedDate;
  final double price;
  final String status;
  //TODO: make status an enum?
  //TODO: add products ordered
  CurrentOrder({
    required this.orderedDate,
    required this.price,
    required this.orderId,
    required this.status,
  });
}
