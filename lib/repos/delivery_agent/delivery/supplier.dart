import 'addressDetail.dart';

class Supplier {
  String businessName;
  String businessContactNo;
  AddressDetail addressDetail;

  Supplier({
    this.businessName,
    this.businessContactNo,
    this.addressDetail,
  });

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
