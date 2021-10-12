class OrderResponse {
  int orderID;

  OrderResponse({this.orderID});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderID'] = this.orderID;
    return data;
  }
}
