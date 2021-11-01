class OrderPriceInformation {
  int totalPrice;
  int deliveryCharge;
  int totalToBePaid;

  OrderPriceInformation({
    this.totalPrice,
    this.deliveryCharge,
    this.totalToBePaid,
  });

  OrderPriceInformation.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    deliveryCharge = json['deliveryCharge'];
    totalToBePaid = json['totalToBePaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    data['deliveryCharge'] = this.deliveryCharge;
    data['totalToBePaid'] = this.totalToBePaid;
    return data;
  }
}
