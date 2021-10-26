class User {
  String firstName;
  String lastName;
  String dateOfBirth;
  String gender;
  String contactNumber;
  String role;
  String email;
  String password;
  String createdAt;
  UserAccount userAccount;
  AddressDetail addressDetail;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.dateOfBirth,
    this.gender,
    this.contactNumber,
    this.role,
    this.createdAt,
    this.userAccount,
    this.addressDetail,
  });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    contactNumber = json['contactNumber'];
    role = json['role'];
    createdAt = json['createdAt'];
    userAccount = json['UserAccount'] != null
        ? new UserAccount.fromJson(json['UserAccount'])
        : null;
    addressDetail = json['AddressDetail'] != null
        ? new AddressDetail.fromJson(json['AddressDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['contactNumber'] = this.contactNumber;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    if (this.userAccount != null) {
      data['UserAccount'] = this.userAccount.toJson();
    }
    if (this.addressDetail != null) {
      data['AddressDetail'] = this.addressDetail.toJson();
    }
    return data;
  }
}

class UserAccount {
  String email;
  bool twoFA;
  String state;
  Null message;
  bool thirdParty;
  Null provider;

  UserAccount({
    this.email,
    this.twoFA,
    this.state,
    this.message,
    this.thirdParty,
    this.provider,
  });

  UserAccount.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    twoFA = json['twoFA'];
    state = json['state'];
    message = json['message'];
    thirdParty = json['thirdParty'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['twoFA'] = this.twoFA;
    data['state'] = this.state;
    data['message'] = this.message;
    data['thirdParty'] = this.thirdParty;
    data['provider'] = this.provider;
    return data;
  }
}

class AddressDetail {
  String streetAddress;
  ProvinceDistrictCity provinceDistrictCity;

  AddressDetail({
    this.streetAddress,
    this.provinceDistrictCity,
  });

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

  @override
  String toString() {
    return this.city +
        ", " +
        this.district +
        ", " +
        this.province +
        " Province";
  }
}
