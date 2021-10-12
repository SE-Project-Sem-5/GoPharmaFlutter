class ProductSize {
  String sizeName;
  String description;

  ProductSize({
    this.sizeName,
    this.description,
  });

  ProductSize.fromJson(Map<String, dynamic> json) {
    sizeName = json['sizeName'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sizeName'] = this.sizeName;
    data['description'] = this.description;
    return data;
  }
}
