class TransientCollectedList {
  String type;
  String msg;
  List<TransientCollectedDelivery> deliveries;

  TransientCollectedList({
    this.type,
    this.msg,
    this.deliveries,
  });

  TransientCollectedList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    msg = json['msg'];
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new TransientCollectedDelivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['msg'] = this.msg;
    if (this.deliveries != null) {
      data['data'] = this.deliveries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransientCollectedDelivery {
  int orderID;
  int totalPrice;
  List<Products> products;
  String destinationDistrict;
  String destinationCity;

  TransientCollectedDelivery({
    this.orderID,
    this.products,
    this.totalPrice,
    this.destinationDistrict,
    this.destinationCity,
  });

  TransientCollectedDelivery.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    destinationDistrict = json['destinationDistrict'];
    totalPrice = json['totalPrice'];
    destinationCity = json['destinationCity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderID'] = this.orderID;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['destinationDistrict'] = this.destinationDistrict;
    data['destinationCity'] = this.destinationCity;
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
