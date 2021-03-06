class NormalOrderList {
  List<NormalOrder> orders;

  NormalOrderList({this.orders});

  NormalOrderList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      orders = [];
      json['data'].forEach((v) {
        orders.add(new NormalOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NormalOrder {
  String orderedDate;
  int totalPrice;
  Null zone;
  int id;

  String status;
  String orderType;
  List<OrderProducts> orderProducts;
  AddressDetail addressDetail;

  NormalOrder({
    this.orderedDate,
    this.totalPrice,
    this.zone,
    this.id,
    this.status,
    this.orderType,
    this.orderProducts,
    this.addressDetail,
  });

  NormalOrder.fromJson(Map<String, dynamic> json) {
    orderedDate = json['orderedDate'];
    totalPrice = json['totalPrice'];
    zone = json['zone'];
    id = json['id'];
    status = json['status'];
    orderType = json['orderType'];
    if (json['OrderProducts'] != null) {
      orderProducts = [];
      json['OrderProducts'].forEach((v) {
        orderProducts.add(new OrderProducts.fromJson(v));
      });
    }
    addressDetail = json['AddressDetail'] != null
        ? new AddressDetail.fromJson(json['AddressDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderedDate'] = this.orderedDate;
    data['totalPrice'] = this.totalPrice;
    data['zone'] = this.zone;
    data['id'] = this.id;
    data['status'] = this.status;
    data['orderType'] = this.orderType;
    if (this.orderProducts != null) {
      data['OrderProducts'] =
          this.orderProducts.map((v) => v.toJson()).toList();
    }
    if (this.addressDetail != null) {
      data['AddressDetail'] = this.addressDetail.toJson();
    }
    return data;
  }
}

class OrderProducts {
  int quantity;
  int id;
  int soldUnitPrice;
  String status;
  int totalPrice;
  Product product;

  OrderProducts({
    this.id,
    this.quantity,
    this.soldUnitPrice,
    this.status,
    this.totalPrice,
    this.product,
  });

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    soldUnitPrice = json['soldUnitPrice'];
    status = json['status'];
    totalPrice = json['totalPrice'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['soldUnitPrice'] = this.soldUnitPrice;
    data['status'] = this.status;
    data['totalPrice'] = this.totalPrice;
    if (this.product != null) {
      data['Product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  String productName;
  String brandName;
  String description;
  bool prescriptionNeeded;
  int unitPrice;
  Category category;
  ProductSize productSize;

  Product({
    this.productName,
    this.brandName,
    this.description,
    this.prescriptionNeeded,
    this.unitPrice,
    this.category,
    this.productSize,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    brandName = json['brandName'];
    description = json['description'];
    prescriptionNeeded = json['prescriptionNeeded'];
    unitPrice = json['unitPrice'];
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
    productSize = json['ProductSize'] != null
        ? new ProductSize.fromJson(json['ProductSize'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['brandName'] = this.brandName;
    data['description'] = this.description;
    data['prescriptionNeeded'] = this.prescriptionNeeded;
    data['unitPrice'] = this.unitPrice;
    if (this.category != null) {
      data['Category'] = this.category.toJson();
    }
    if (this.productSize != null) {
      data['ProductSize'] = this.productSize.toJson();
    }
    return data;
  }
}

class Category {
  String categoryName;

  Category({this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryName'] = this.categoryName;
    return data;
  }
}

class ProductSize {
  String sizeName;
  String description;

  ProductSize({this.sizeName, this.description});

  ProductSize.fromJson(Map<String, dynamic> json) {
    sizeName = json['sizeName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sizeName'] = this.sizeName;
    data['description'] = this.description;
    return data;
  }
}

class AddressDetail {
  String streetAddress;
  ProvinceDistrictCity provinceDistrictCity;

  AddressDetail({this.streetAddress, this.provinceDistrictCity});

  AddressDetail.fromJson(Map<String, dynamic> json) {
    streetAddress = json['streetAddress'];
    provinceDistrictCity = json['ProvinceDistrictCity'] != null
        ? new ProvinceDistrictCity.fromJson(json['ProvinceDistrictCity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['streetAddress'] = this.streetAddress;
    if (this.provinceDistrictCity != null) {
      data['ProvinceDistrictCity'] = this.provinceDistrictCity.toJson();
    }
    return data;
  }
}

class ProvinceDistrictCity {
  String province;
  String district;
  String city;

  ProvinceDistrictCity({this.province, this.district, this.city});

  ProvinceDistrictCity.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    district = json['district'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province'] = this.province;
    data['district'] = this.district;
    data['city'] = this.city;
    return data;
  }
}
