class ProductSize {
  int id;
  String sizeName;
  String description;
  String createdAt;
  String updatedAt;

  ProductSize(
      {this.id,
      this.sizeName,
      this.description,
      this.createdAt,
      this.updatedAt});

  ProductSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sizeName = json['sizeName'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sizeName'] = this.sizeName;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
