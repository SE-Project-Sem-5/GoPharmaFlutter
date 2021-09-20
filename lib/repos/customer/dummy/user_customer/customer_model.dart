class Customer {
  String firstName;
  String lastName;
  DateTime birthDate;
  String email;
  String password;
  String district;
  String province;
  String city;
  String country;
  String phoneNumber;
  String streetName;

  Customer({
    this.firstName,
    this.lastName,
    this.birthDate,
    this.email,
    this.password,
    this.streetName,
    this.city,
    this.district,
    this.province,
    this.country = "Sri Lanka",
    this.phoneNumber,
  });
}
