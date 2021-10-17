class DeliveryResponse {
  Response response;

  DeliveryResponse({this.response});

  DeliveryResponse.fromJson(Map<String, dynamic> json) {
    response =
        json['data'] != null ? new Response.fromJson(json['data']) : null;
  }
}

class Response {
  int reservedOrder;

  Response({this.reservedOrder});

  Response.fromJson(Map<String, dynamic> json) {
    reservedOrder = json['reserved_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reserved_order'] = this.reservedOrder;
    return data;
  }
}
