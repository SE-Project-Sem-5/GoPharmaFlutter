class Address {
  String streetAddress;
  String city;
  String district;

  Address({this.streetAddress, this.city, this.district});

  Address.fromJson(Map<String, dynamic> json) {
    streetAddress = json['streetAddress'];
    city = json['city'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['streetAddress'] = this.streetAddress;
    data['city'] = this.city;
    data['district'] = this.district;
    return data;
  }
}
