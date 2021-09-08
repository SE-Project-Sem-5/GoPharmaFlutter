class PastOrder {
  final String orderId;
  final DateTime orderedDate;
  final DateTime completedDate;
  final double price;
  //TODO: add products ordered
  PastOrder({
    required this.orderedDate,
    required this.completedDate,
    required this.price,
    required this.orderId,
  });
}
