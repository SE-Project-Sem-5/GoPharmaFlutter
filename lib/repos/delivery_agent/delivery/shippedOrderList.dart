class ShippedOrderList {
  List<ShippedDelivery> deliveries;

  ShippedOrderList({this.deliveries});

  ShippedOrderList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new ShippedDelivery.fromJson(v));
      });
    }
  }
}

class ShippedDelivery {
  int orderID;
  int totalPrice;
  int customerID;
  String customerEmail;
  String customerContactNumber;
  String customerAddress;
  List<Products> products;

  ShippedDelivery({
    this.orderID,
    this.totalPrice,
    this.customerID,
    this.customerEmail,
    this.customerContactNumber,
    this.customerAddress,
    this.products,
  });

  ShippedDelivery.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    totalPrice = json['totalPrice'];
    customerID = json['customerID'];
    customerEmail = json['customerEmail'];
    customerContactNumber = json['customerContactNumber'];
    customerAddress = json['customerAddress'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderID'] = this.orderID;
    data['totalPrice'] = this.totalPrice;
    data['customerID'] = this.customerID;
    data['customerEmail'] = this.customerEmail;
    data['customerContactNumber'] = this.customerContactNumber;
    data['customerAddress'] = this.customerAddress;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  int quantity;
  int totalPrice;
  String productName;

  Products({
    this.id,
    this.quantity,
    this.totalPrice,
    this.productName,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['totalPrice'] = this.totalPrice;
    data['productName'] = this.productName;
    return data;
  }
}
