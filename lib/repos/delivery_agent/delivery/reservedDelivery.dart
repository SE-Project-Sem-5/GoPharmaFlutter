class ReservedDeliveryList {
  List<ReservedDelivery> deliveries;

  ReservedDeliveryList({this.deliveries});

  ReservedDeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new ReservedDelivery.fromJson(v));
      });
    }
  }
}

class ReservedDelivery {
  int id;
  String productName;
  int quantity;
  String brandName;
  int totalPrice;
  String supplierName;
  String supplierContactNo;
  String address;
  String district;

  ReservedDelivery({
    this.id,
    this.productName,
    this.quantity,
    this.brandName,
    this.totalPrice,
    this.supplierName,
    this.supplierContactNo,
    this.address,
    this.district,
  });

  ReservedDelivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    quantity = json['quantity'];
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
    data['brandName'] = this.brandName;
    data['totalPrice'] = this.totalPrice;
    data['supplierName'] = this.supplierName;
    data['supplierContactNo'] = this.supplierContactNo;
    data['address'] = this.address;
    data['district'] = this.district;
    return data;
  }
}
