import 'package:go_pharma/repos/customer/actual/addressDetails.dart';

class Supplier {
  int userID;
  String businessName;
  Null businessContactNo;
  Null nicMainSide;
  Null nicBackSide;
  Null businessRegistrationCertificate;
  Null pharmacyLicense;
  Null verificationState;
  String createdAt;
  String updatedAt;
  int verifiedAdmin;
  int businessAddressID;
  Null transferAccountID;
  AddressDetail addressDetail;

  Supplier(
      {this.userID,
      this.businessName,
      this.businessContactNo,
      this.nicMainSide,
      this.nicBackSide,
      this.businessRegistrationCertificate,
      this.pharmacyLicense,
      this.verificationState,
      this.createdAt,
      this.updatedAt,
      this.verifiedAdmin,
      this.businessAddressID,
      this.transferAccountID,
      this.addressDetail});

  Supplier.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    businessName = json['businessName'];
    businessContactNo = json['businessContactNo'];
    nicMainSide = json['nicMainSide'];
    nicBackSide = json['nicBackSide'];
    businessRegistrationCertificate = json['businessRegistrationCertificate'];
    pharmacyLicense = json['pharmacyLicense'];
    verificationState = json['verificationState'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    verifiedAdmin = json['verifiedAdmin'];
    businessAddressID = json['businessAddressID'];
    transferAccountID = json['transferAccountID'];
    addressDetail = json['AddressDetail'] != null
        ? new AddressDetail.fromJson(json['AddressDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['businessName'] = this.businessName;
    data['businessContactNo'] = this.businessContactNo;
    data['nicMainSide'] = this.nicMainSide;
    data['nicBackSide'] = this.nicBackSide;
    data['businessRegistrationCertificate'] =
        this.businessRegistrationCertificate;
    data['pharmacyLicense'] = this.pharmacyLicense;
    data['verificationState'] = this.verificationState;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['verifiedAdmin'] = this.verifiedAdmin;
    data['businessAddressID'] = this.businessAddressID;
    data['transferAccountID'] = this.transferAccountID;
    if (this.addressDetail != null) {
      data['AddressDetail'] = this.addressDetail.toJson();
    }
    return data;
  }
}
