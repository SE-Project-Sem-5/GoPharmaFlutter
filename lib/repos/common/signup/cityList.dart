class CityList {
  List<City> cities;

  CityList({this.cities});

  CityList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      cities = [];
      json['data'].forEach((v) {
        cities.add(new City.fromJson(v));
      });
    }
  }
}

class City {
  String description;
  String city;
  String district;
  String province;

  City({this.description, this.city, this.district, this.province});

  City.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    city = json['city'];
    district = json['district'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['city'] = this.city;
    data['district'] = this.district;
    data['province'] = this.province;
    return data;
  }
}
