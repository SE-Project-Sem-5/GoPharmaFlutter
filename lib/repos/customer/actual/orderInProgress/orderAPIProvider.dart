import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/deliveryDetails.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderPriceInformation.dart';

class OrderAPIProvider {
  final Dio _dio = Client.init();

  Future<OrderPriceInformation> getDeliveryChargeForNormalOrder(
      DeliveryDetails delivery) async {
    print(delivery);
    try {
      Response response = await _dio.post(
        "customer/order/delivery",
        data: delivery.toJson(),
      );
      print(response);
      print(response.data["data"]);
      return OrderPriceInformation.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderPriceInformation();
    }
  }
}
