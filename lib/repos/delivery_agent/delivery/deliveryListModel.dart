class DeliveryList {
  List<Delivery> deliveries;

  DeliveryList({this.deliveries});

  DeliveryList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      deliveries = [];
      json['data'].forEach((v) {
        deliveries.add(new Delivery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deliveries != null) {
      data['delivery'] = this.deliveries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Delivery {
  int quantity;
  String status;
  int id;
  int totalPrice;
  Product product;

  Delivery(
      {this.quantity, this.status, this.id, this.totalPrice, this.product});

  Delivery.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    status = json['status'];
    id = json['id'];
    totalPrice = json['totalPrice'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['id'] = this.id;
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
  Supplier supplier;

  Product({this.productName, this.brandName, this.supplier});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    brandName = json['brandName'];
    supplier = json['Supplier'] != null
        ? new Supplier.fromJson(json['Supplier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['brandName'] = this.brandName;
    if (this.supplier != null) {
      data['Supplier'] = this.supplier.toJson();
    }
    return data;
  }
}

class Supplier {
  String businessName;
  String businessContactNo;
  AddressDetail addressDetail;

  Supplier({this.businessName, this.businessContactNo, this.addressDetail});

  Supplier.fromJson(Map<String, dynamic> json) {
    businessName = json['businessName'];
    businessContactNo = json['businessContactNo'];
    addressDetail = json['AddressDetail'] != null
        ? new AddressDetail.fromJson(json['AddressDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessName'] = this.businessName;
    data['businessContactNo'] = this.businessContactNo;
    if (this.addressDetail != null) {
      data['AddressDetail'] = this.addressDetail.toJson();
    }
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
  String city;
  String district;

  ProvinceDistrictCity({this.city, this.district});

  ProvinceDistrictCity.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['district'] = this.district;
    return data;
  }
}
