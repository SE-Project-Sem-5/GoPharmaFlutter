class ReturnCollectedOrderList {
  List<ReturnCollectedOrders> deliveries;

  ReturnCollectedOrderList({this.deliveries});

  ReturnCollectedOrderList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new ReturnCollectedOrders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveries != null) {
      data['returnCollectedOrders'] =
          this.deliveries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReturnCollectedOrders {
  int id;
  String productName;
  int quantity;
  String brandName;
  int totalPrice;
  String customerName;
  String customerContactNo;
  String customerAddress;
  String supplierName;
  String supplierContactNo;
  String supplierAddress;

  ReturnCollectedOrders(
      {this.id,
      this.productName,
      this.quantity,
      this.brandName,
      this.totalPrice,
      this.customerName,
      this.customerContactNo,
      this.customerAddress,
      this.supplierName,
      this.supplierContactNo,
      this.supplierAddress});

  ReturnCollectedOrders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    quantity = json['quantity'];
    brandName = json['brandName'];
    totalPrice = json['totalPrice'];
    customerName = json['customerName'];
    customerContactNo = json['customerContactNo'];
    customerAddress = json['customerAddress'];
    supplierName = json['supplierName'];
    supplierContactNo = json['supplierContactNo'];
    supplierAddress = json['supplierAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['quantity'] = this.quantity;
    data['brandName'] = this.brandName;
    data['totalPrice'] = this.totalPrice;
    data['customerName'] = this.customerName;
    data['customerContactNo'] = this.customerContactNo;
    data['customerAddress'] = this.customerAddress;
    data['supplierName'] = this.supplierName;
    data['supplierContactNo'] = this.supplierContactNo;
    data['supplierAddress'] = this.supplierAddress;
    return data;
  }
}
