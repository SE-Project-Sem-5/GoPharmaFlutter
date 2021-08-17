import 'package:flutter/material.dart';

class Customer {
  String? firstName;
  String? lastName;
  DateTime? birthDate;
  // List<Card>? cards = [];
  String? email;
  String? password;
  String? city;
  String country;

  Customer({
    this.firstName,
    this.lastName,
    this.birthDate,
    // this.cards,
    this.email,
    this.password,
    this.city,
    this.country = "Sri Lanka",
  });
}
