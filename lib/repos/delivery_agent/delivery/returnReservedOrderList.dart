class ReturnReservedOrderList {
  List<ReturnReservedDelivery> deliveries;

  ReturnReservedOrderList({this.deliveries});

  ReturnReservedOrderList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new ReturnReservedDelivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveries != null) {
      data['returnReservedOrders'] =
          this.deliveries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReturnReservedDelivery {
  int id;
  int quantity;
  int totalPrice;
  int orderID;
  String productName;
  String customerName;
  String customerContactNumber;
  String customerAddress;
  String supplierName;
  String supplierContactNumber;
  String supplierAddress;

  ReturnReservedDelivery(
      {this.id,
      this.quantity,
      this.totalPrice,
      this.orderID,
      this.productName,
      this.customerName,
      this.customerContactNumber,
      this.customerAddress,
      this.supplierName,
      this.supplierContactNumber,
      this.supplierAddress});

  ReturnReservedDelivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    orderID = json['orderID'];
    productName = json['productName'];
    customerName = json['customerName'];
    customerContactNumber = json['customerContactNumber'];
    customerAddress = json['customerAddress'];
    supplierName = json['supplierName'];
    supplierContactNumber = json['supplierContactNumber'];
    supplierAddress = json['supplierAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['totalPrice'] = this.totalPrice;
    data['orderID'] = this.orderID;
    data['productName'] = this.productName;
    data['customerName'] = this.customerName;
    data['customerContactNumber'] = this.customerContactNumber;
    data['customerAddress'] = this.customerAddress;
    data['supplierName'] = this.supplierName;
    data['supplierContactNumber'] = this.supplierContactNumber;
    data['supplierAddress'] = this.supplierAddress;
    return data;
  }
}
