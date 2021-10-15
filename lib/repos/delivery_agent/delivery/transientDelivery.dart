class TransientDeliveryList {
  List<TransientDelivery> deliveries;

  TransientDeliveryList({this.deliveries});

  TransientDeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new TransientDelivery.fromJson(v));
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

class TransientDelivery {
  int orderID;
  int totalPrice;
  String destinationDistrict;
  List<Products> products;

  TransientDelivery({
    this.orderID,
    this.totalPrice,
    this.destinationDistrict,
    this.products,
  });

  TransientDelivery.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    totalPrice = json['totalPrice'];
    destinationDistrict = json['destinationDistrict'];
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
    data['destinationDistrict'] = this.destinationDistrict;
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
