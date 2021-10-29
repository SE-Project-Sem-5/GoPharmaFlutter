class PrescriptionOrderList {
  List<PrescriptionOrder> prescriptionOrder;

  PrescriptionOrderList({this.prescriptionOrder});

  PrescriptionOrderList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      prescriptionOrder = [];
      json['data'].forEach((v) {
        prescriptionOrder.add(new PrescriptionOrder.fromJson(v));
      });
    }
  }
}

class PrescriptionOrder {
  String orderedDate;
  Null totalPrice;
  String zone;
  String status;
  String orderType;
  int id;
  List<Prescriptions> prescriptions;
  AddressDetail addressDetail;

  PrescriptionOrder({
    this.orderedDate,
    this.totalPrice,
    this.zone,
    this.status,
    this.orderType,
    this.id,
    this.prescriptions,
    this.addressDetail,
  });

  PrescriptionOrder.fromJson(Map<String, dynamic> json) {
    orderedDate = json['orderedDate'];
    totalPrice = json['totalPrice'];
    zone = json['zone'];
    status = json['status'];
    orderType = json['orderType'];
    id = json['id'];
    if (json['Prescriptions'] != null) {
      prescriptions = [];
      json['Prescriptions'].forEach((v) {
        prescriptions.add(new Prescriptions.fromJson(v));
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
    data['status'] = this.status;
    data['orderType'] = this.orderType;
    data['id'] = this.id;
    if (this.prescriptions != null) {
      data['Prescriptions'] =
          this.prescriptions.map((v) => v.toJson()).toList();
    }
    if (this.addressDetail != null) {
      data['AddressDetail'] = this.addressDetail.toJson();
    }
    return data;
  }
}

class Prescriptions {
  String imageName;

  Prescriptions({
    this.imageName,
  });

  Prescriptions.fromJson(Map<String, dynamic> json) {
    imageName = json['imageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageName'] = this.imageName;
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
