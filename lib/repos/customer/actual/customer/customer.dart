class Customer {
  int userID;
  String createdAt;
  String updatedAt;

  Customer({this.userID, this.createdAt, this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
