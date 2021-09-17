class Location {
  List<String> districts;

  Location({this.districts});

  Location.fromJson(Map<String, dynamic> json) {
    if (json['districts'] != null) {
      districts = [];
      json['districts'].forEach((v) {
        districts.add(v["district"]);
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.districts != null) {
  //     data['districts'] = this.districts.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
