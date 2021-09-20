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
}
