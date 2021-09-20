class Product {
  int id;
  String productName;
  String description;
  bool prescriptionNeeded;
  bool returnable;
  int unitPrice;
  String priceDescription;
  int discount;
  int stock;
  int reorderingLevel;
  String createdAt;
  String updatedAt;
  String brandName;
  int categoryID;
  int supplierID;
  int size;

  Product(
      {this.id,
      this.productName,
      this.description,
      this.prescriptionNeeded,
      this.returnable,
      this.unitPrice,
      this.priceDescription,
      this.discount,
      this.stock,
      this.reorderingLevel,
      this.createdAt,
      this.updatedAt,
      this.brandName,
      this.categoryID,
      this.supplierID,
      this.size});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    description = json['description'];
    prescriptionNeeded = json['prescriptionNeeded'];
    returnable = json['returnable'];
    unitPrice = json['unitPrice'];
    priceDescription = json['priceDescription'];
    discount = json['discount'];
    stock = json['stock'];
    reorderingLevel = json['reorderingLevel'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    brandName = json['brandName'];
    categoryID = json['categoryID'];
    supplierID = json['supplierID'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['description'] = this.description;
    data['prescriptionNeeded'] = this.prescriptionNeeded;
    data['returnable'] = this.returnable;
    data['unitPrice'] = this.unitPrice;
    data['priceDescription'] = this.priceDescription;
    data['discount'] = this.discount;
    data['stock'] = this.stock;
    data['reorderingLevel'] = this.reorderingLevel;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['brandName'] = this.brandName;
    data['categoryID'] = this.categoryID;
    data['supplierID'] = this.supplierID;
    data['size'] = this.size;
    return data;
  }
}
