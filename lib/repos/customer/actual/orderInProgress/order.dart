class Order {
  int totalPrice;
  int deliveryCharge;
  int totalToBePaid;
  String orderType;
  int customerID;
  Address address;
  List<Products> products;
  String hasPrescriptions;

  Order({
    this.totalPrice,
    this.deliveryCharge,
    this.totalToBePaid,
    this.orderType,
    this.customerID,
    this.address,
    this.products,
    this.hasPrescriptions,
  });

  Order.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    deliveryCharge = json['deliveryCharge'];
    totalToBePaid = json['totalToBePaid'];
    orderType = json['orderType'];
    customerID = json['customerID'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    hasPrescriptions = json['hasPrescriptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    data['deliveryCharge'] = this.deliveryCharge;
    data['totalToBePaid'] = this.totalToBePaid;
    data['orderType'] = this.orderType;
    data['customerID'] = this.customerID;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['hasPrescriptions'] = this.hasPrescriptions;
    return data;
  }
}

class Address {
  String streetAddress;
  String city;
  String district;

  Address({this.streetAddress, this.city, this.district});

  Address.fromJson(Map<String, dynamic> json) {
    streetAddress = json['streetAddress'];
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['streetAddress'] = this.streetAddress;
    data['city'] = this.city;
    data['district'] = this.district;
    return data;
  }
}

class Products {
  String productID;
  int quantity;
  int soldUnitPrice;
  int supplierID;
  int addedChargePercentage;
  int addedCharge;

  Products({
    this.productID,
    this.quantity,
    this.soldUnitPrice,
    this.supplierID,
    this.addedChargePercentage,
    this.addedCharge,
  });

  Products.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    quantity = json['quantity'];
    soldUnitPrice = json['soldUnitPrice'];
    supplierID = json['supplierID'];
    addedChargePercentage = json['addedChargePercentage'];
    addedCharge = json['addedCharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['quantity'] = this.quantity;
    data['soldUnitPrice'] = this.soldUnitPrice;
    data['supplierID'] = this.supplierID;
    data['addedChargePercentage'] = this.addedChargePercentage;
    data['addedCharge'] = this.addedCharge;
    return data;
  }
}
