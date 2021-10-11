class DeliveryDetails {
  int customerAddressID;
  String city;
  String district;
  String streetAddress;
  List<DeliveryChargeProduct> products;

  DeliveryDetails({
    this.customerAddressID,
    this.city,
    this.district,
    this.streetAddress,
    this.products,
  });

  DeliveryDetails.fromJson(Map<String, dynamic> json) {
    customerAddressID = json['customerAddressID'];
    city = json['city'];
    district = json['district'];
    streetAddress = json['streetAddress'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new DeliveryChargeProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerAddressID'] = this.customerAddressID;
    data['city'] = this.city;
    data['district'] = this.district;
    data['streetAddress'] = this.streetAddress;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryChargeProduct {
  String productID;
  int quantity;
  double soldUnitPrice;
  int supplierID;

  DeliveryChargeProduct({
    this.productID,
    this.quantity,
    this.soldUnitPrice,
    this.supplierID,
  });

  DeliveryChargeProduct.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    quantity = json['quantity'];
    soldUnitPrice = json['soldUnitPrice'];
    supplierID = json['supplierID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['quantity'] = this.quantity;
    data['soldUnitPrice'] = this.soldUnitPrice;
    data['supplierID'] = this.supplierID;
    return data;
  }
}
