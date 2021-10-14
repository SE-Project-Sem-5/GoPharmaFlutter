class DeliveryList {
  List<Delivery> delivery;

  DeliveryList({this.delivery});

  DeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['delivery'] != null) {
      delivery = [];
      json['delivery'].forEach((v) {
        delivery.add(new Delivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.delivery != null) {
      data['delivery'] = this.delivery.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Delivery {
  int id;
  int orderID;
  int productID;
  int quantity;
  int soldUnitPrice;
  int addedChargePercentage;
  int addedCharge;
  int totalPrice;
  String status;
  String comment;
  Product product;

  Delivery(
      {this.id,
      this.orderID,
      this.productID,
      this.quantity,
      this.soldUnitPrice,
      this.addedChargePercentage,
      this.addedCharge,
      this.totalPrice,
      this.status,
      this.comment,
      this.product});

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderID = json['orderID'];
    productID = json['productID'];
    quantity = json['quantity'];
    soldUnitPrice = json['soldUnitPrice'];
    addedChargePercentage = json['addedChargePercentage'];
    addedCharge = json['addedCharge'];
    totalPrice = json['totalPrice'];
    status = json['status'];
    comment = json['comment'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderID'] = this.orderID;
    data['productID'] = this.productID;
    data['quantity'] = this.quantity;
    data['soldUnitPrice'] = this.soldUnitPrice;
    data['addedChargePercentage'] = this.addedChargePercentage;
    data['addedCharge'] = this.addedCharge;
    data['totalPrice'] = this.totalPrice;
    data['status'] = this.status;
    data['comment'] = this.comment;
    if (this.product != null) {
      data['Product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  int id;
  String productName;
  String localProductNumber;
  String brandName;
  int categoryID;
  String description;
  int supplierID;
  bool prescriptionNeeded;
  int size;
  bool returnable;
  int unitPrice;
  String priceDescription;
  int discount;
  int stock;
  int reorderingLevel;

  Product(
      {this.id,
      this.productName,
      this.localProductNumber,
      this.brandName,
      this.categoryID,
      this.description,
      this.supplierID,
      this.prescriptionNeeded,
      this.size,
      this.returnable,
      this.unitPrice,
      this.priceDescription,
      this.discount,
      this.stock,
      this.reorderingLevel});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    localProductNumber = json['localProductNumber'];
    brandName = json['brandName'];
    categoryID = json['categoryID'];
    description = json['description'];
    supplierID = json['supplierID'];
    prescriptionNeeded = json['prescriptionNeeded'];
    size = json['size'];
    returnable = json['returnable'];
    unitPrice = json['unitPrice'];
    priceDescription = json['priceDescription'];
    discount = json['discount'];
    stock = json['stock'];
    reorderingLevel = json['reorderingLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['localProductNumber'] = this.localProductNumber;
    data['brandName'] = this.brandName;
    data['categoryID'] = this.categoryID;
    data['description'] = this.description;
    data['supplierID'] = this.supplierID;
    data['prescriptionNeeded'] = this.prescriptionNeeded;
    data['size'] = this.size;
    data['returnable'] = this.returnable;
    data['unitPrice'] = this.unitPrice;
    data['priceDescription'] = this.priceDescription;
    data['discount'] = this.discount;
    data['stock'] = this.stock;
    data['reorderingLevel'] = this.reorderingLevel;
    return data;
  }
}
