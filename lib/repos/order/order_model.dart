class Order {
  final String order_id;
  final DateTime orderedDate;
  final DateTime completedDate;
  final double price;
  //TODO: add products ordered
  Order({
    required this.orderedDate,
    required this.completedDate,
    required this.price,
    required this.order_id,
  });
}
