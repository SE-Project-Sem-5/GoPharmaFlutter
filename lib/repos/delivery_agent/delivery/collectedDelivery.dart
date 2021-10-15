class CollectedDeliveryList {
  List<CollectedDelivery> deliveries;

  CollectedDeliveryList({this.deliveries});

  CollectedDeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new CollectedDelivery.fromJson(v));
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

class CollectedDelivery {
  int id;
  List<Products> products;
  String status;
  int totalPrice;
  String district;
  String currentLocation;

  CollectedDelivery(
      {this.id,
      this.products,
      this.status,
      this.totalPrice,
      this.district,
      this.currentLocation});

  CollectedDelivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    status = json['status'];
    totalPrice = json['totalPrice'];
    district = json['district'];
    currentLocation = json['currentLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['totalPrice'] = this.totalPrice;
    data['district'] = this.district;
    data['currentLocation'] = this.currentLocation;
    return data;
  }
}

class Products {
  int id;
  int quantity;
  int totalPrice;
  Product product;

  Products({this.id, this.quantity, this.totalPrice, this.product});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['totalPrice'] = this.totalPrice;
    if (this.product != null) {
      data['Product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  String productName;

  Product({this.productName});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    return data;
  }
}
