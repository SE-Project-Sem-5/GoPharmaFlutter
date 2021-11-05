class SearchProductList {
  List<Products> products;

  SearchProductList({this.products});

  SearchProductList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }
}

class Products {
  int id;
  String productName;
  int categoryID;
  int supplierID;
  int size;
  String businessName;
  String description;
  String brandName;
  num addedChargePercentage;
  num addedCharge;
  num beforeDiscountPrice;
  num discount;
  num sellingPrice;
  Null url;
  int stock;
  bool prescriptionNeeded;
  bool returnable;

  Products({
    this.id,
    this.productName,
    this.categoryID,
    this.supplierID,
    this.description,
    this.businessName,
    this.size,
    this.brandName,
    this.returnable,
    this.addedChargePercentage,
    this.addedCharge,
    this.beforeDiscountPrice,
    this.discount,
    this.sellingPrice,
    this.url,
    this.stock,
    this.prescriptionNeeded,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    categoryID = json['categoryID'];
    returnable = json['returnable'];
    size = json['size'];
    supplierID = json['supplierID'];
    description = json['description'];
    businessName = json['businessName'];
    brandName = json['brandName'];
    addedChargePercentage = json['addedChargePercentage'];
    addedCharge = json['addedCharge'];
    beforeDiscountPrice = json['beforeDiscountPrice'];
    discount = json['discount'];
    sellingPrice = json['sellingPrice'];
    url = json['url'];
    stock = json['stock'];
    prescriptionNeeded = json['prescriptionNeeded'];
  }
}
