class PrescriptionOrder {
  String zone;

  PrescriptionOrder({
    this.zone,
  });

  PrescriptionOrder.fromJson(Map<String, dynamic> json) {
    zone = json['zone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zone'] = this.zone;
    return data;
  }
}
