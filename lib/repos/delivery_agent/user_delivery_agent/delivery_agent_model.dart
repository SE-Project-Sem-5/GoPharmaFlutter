class DeliveryAgent {
  String? firstName;
  String? lastName;
  DateTime? birthDate;
  String? email;
  String? password;
  String? city;
  String country;

  DeliveryAgent({
    this.firstName,
    this.lastName,
    this.birthDate,
    this.email,
    this.password,
    this.city,
    this.country = "Sri Lanka",
  });
}
