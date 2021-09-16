class CurrentOrder {
  final String orderId;
  final DateTime orderedDate;
  final double price;
  final String status;
  //TODO: make status an enum?
  //TODO: add products ordered
  CurrentOrder({
      this.orderedDate,
      this.price,
      this.orderId,
      this.status,
  });
}
