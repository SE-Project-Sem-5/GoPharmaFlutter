class CurrentOrder {
  final String order_id;
  final DateTime orderedDate;
  final double price;
  final String status;
  //TODO: make status an enum?
  //TODO: add products ordered
  CurrentOrder({
    required this.orderedDate,
    required this.price,
    required this.order_id,
    required this.status,
  });
}
