class NormalOrderResponse {
  int orderID;
  int totalPrice;

  NormalOrderResponse({this.orderID, this.totalPrice});

  NormalOrderResponse.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    totalPrice = json['totalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderID'] = this.orderID;
    data['totalPrice'] = this.totalPrice;
    return data;
  }
}
