import 'package:go_pharma/repos/customer/actual/addressDetails.dart';

class Customer {
  int id;
  String firstName;
  String lastName;
  String dateOfBirth;
  String gender;
  String contactNumber;
  String joinedDate;
  String createdAt;
  String updatedAt;
  int homeAddressID;
  AddressDetail addressDetail;

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.contactNumber,
      this.joinedDate,
      this.createdAt,
      this.updatedAt,
      this.homeAddressID,
      this.addressDetail});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    contactNumber = json['contactNumber'];
    joinedDate = json['joinedDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    homeAddressID = json['homeAddressID'];
    addressDetail = json['AddressDetail'] != null
        ? new AddressDetail.fromJson(json['AddressDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['contactNumber'] = this.contactNumber;
    data['joinedDate'] = this.joinedDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['homeAddressID'] = this.homeAddressID;
    if (this.addressDetail != null) {
      data['AddressDetail'] = this.addressDetail.toJson();
    }
    return data;
  }
}
