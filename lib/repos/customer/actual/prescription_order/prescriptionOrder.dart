class PrescriptionOrder {
  int customerID;
  String zone;

  PrescriptionOrder({
    this.customerID,
    this.zone,
  });

  PrescriptionOrder.fromJson(Map<String, dynamic> json) {
    customerID = json['customerID'];
    zone = json['zone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerID'] = this.customerID;
    data['zone'] = this.zone;
    return data;
  }
}
