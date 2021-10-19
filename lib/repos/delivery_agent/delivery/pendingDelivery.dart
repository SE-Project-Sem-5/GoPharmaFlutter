class PendingDeliveryList {
  List<Delivery> deliveries;

  PendingDeliveryList({this.deliveries});

  PendingDeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new Delivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveries != null) {
      data['deliveries'] = this.deliveries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Delivery {
  int id;
  String productName;
  int quantity;
  String status;
  String brandName;
  int totalPrice;
  String supplierName;
  String supplierContactNo;
  String address;
  String district;

  Delivery({
    this.id,
    this.productName,
    this.quantity,
    this.status,
    this.brandName,
    this.totalPrice,
    this.supplierName,
    this.supplierContactNo,
    this.address,
    this.district,
  });

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    quantity = json['quantity'];
    status = json['status'];
    brandName = json['brandName'];
    totalPrice = json['totalPrice'];
    supplierName = json['supplierName'];
    supplierContactNo = json['supplierContactNo'];
    address = json['address'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['brandName'] = this.brandName;
    data['totalPrice'] = this.totalPrice;
    data['supplierName'] = this.supplierName;
    data['supplierContactNo'] = this.supplierContactNo;
    data['address'] = this.address;
    data['district'] = this.district;
    return data;
  }
}
