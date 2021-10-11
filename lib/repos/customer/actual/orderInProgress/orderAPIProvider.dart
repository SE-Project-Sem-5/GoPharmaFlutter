import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/deliveryDetails.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/normalCashOrder.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderPriceInformation.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';

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

  Future<NormalOrderResponse> confirmNormalCashPrescriptionlessOrder(
      NormalPrescriptionlessOrder order) async {
    try {
      Response response = await _dio.post(
        "customer/order/normal/cash/confirm",
        data: order.toJson(),
      );
      print(response);
      print(response.data["data"]);
      return NormalOrderResponse.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NormalOrderResponse();
    }
  }

  Future<NormalOrderResponse> confirmNormalOnlinePrescriptionlessOrder(
      NormalPrescriptionlessOrder order) async {
    print(order);
    try {
      Response response = await _dio.post(
        "customer/order/normal/online/confirm",
        data: order.toJson(),
      );
      print(response);
      print(response.data["data"]);
      return NormalOrderResponse.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NormalOrderResponse();
    }
  }

  Future<OrderPriceInformation> confirmPrescriptionOrder(
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
