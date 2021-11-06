class Supplier {
  int userID;
  String businessName;
  String businessContactNo;
  String nicMainSide;
  String nicBackSide;
  String businessRegistrationCertificate;
  String pharmacyLicense;
  int followers;
  bool verificationState;
  int verifiedAdmin;
  int transferAccountID;
  String createdAt;
  String updatedAt;
  int businessAddressID;

  Supplier({
    this.userID,
    this.businessName,
    this.businessContactNo,
    this.nicMainSide,
    this.nicBackSide,
    this.businessRegistrationCertificate,
    this.pharmacyLicense,
    this.followers,
    this.verificationState,
    this.verifiedAdmin,
    this.transferAccountID,
    this.createdAt,
    this.updatedAt,
    this.businessAddressID,
  });

  Supplier.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    businessName = json['businessName'];
    businessContactNo = json['businessContactNo'];
    nicMainSide = json['nicMainSide'];
    nicBackSide = json['nicBackSide'];
    businessRegistrationCertificate = json['businessRegistrationCertificate'];
    pharmacyLicense = json['pharmacyLicense'];
    followers = json['followers'];
    verificationState = json['verificationState'];
    verifiedAdmin = json['verifiedAdmin'];
    transferAccountID = json['transferAccountID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    businessAddressID = json['businessAddressID'];
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
    data['followers'] = this.followers;
    data['verificationState'] = this.verificationState;
    data['verifiedAdmin'] = this.verifiedAdmin;
    data['transferAccountID'] = this.transferAccountID;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['businessAddressID'] = this.businessAddressID;
    return data;
  }
}
