import 'package:go_pharma/repos/customer/actual/addressDetails.dart';
import 'package:go_pharma/repos/customer/actual/customer/customer.dart';

class User {
  int id;
  String firstName;
  String lastName;
  int homeAddressID;
  String dateOfBirth;
  String gender;
  String contactNumber;
  String createdAt;
  String updatedAt;
  Customer customer;
  AddressDetail addressDetail;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.homeAddressID,
      this.dateOfBirth,
      this.gender,
      this.contactNumber,
      this.createdAt,
      this.updatedAt,
      this.customer,
      this.addressDetail});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    homeAddressID = json['homeAddressID'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    contactNumber = json['contactNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    customer = json['Customer'] != null
        ? new Customer.fromJson(json['Customer'])
        : null;
    addressDetail = json['AddressDetail'] != null
        ? new AddressDetail.fromJson(json['AddressDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['homeAddressID'] = this.homeAddressID;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['contactNumber'] = this.contactNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.customer != null) {
      data['Customer'] = this.customer.toJson();
    }
    if (this.addressDetail != null) {
      data['AddressDetail'] = this.addressDetail.toJson();
    }
    return data;
  }
}
