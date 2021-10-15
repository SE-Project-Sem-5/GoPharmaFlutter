import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/pendingDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/reservedDelivery.dart';

import 'collectedDelivery.dart';

class DeliveryListAPIProvider {
  final Dio _dio = Client.init();

  Future<PendingDeliveryList> getConfirmedDeliveryOrders(
      int deliveryAgentID, int deliveryAgentHomeAddressID) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/view",
        data: {
          "deliveryAgentID": deliveryAgentID,
          "deliveryAgentHomeAddressID": deliveryAgentHomeAddressID,
        },
      );
      print(response);
      return PendingDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PendingDeliveryList();
    }
  }

  Future<ReservedDeliveryList> getReservedDeliveryOrders(
      int deliveryAgentHomeAddressID) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/reserved/view",
        data: {
          "deliveryAgentID": deliveryAgentHomeAddressID,
        },
      );
      print(response.data["data"]);
      return ReservedDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ReservedDeliveryList();
    }
  }

  Future<CollectedDeliveryList> getCollectedDeliveryOrders(
      int deliveryAgentHomeAddressID) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/collected/view",
        data: {
          "deliveryAgentHomeAddressID": deliveryAgentHomeAddressID,
        },
      );
      return CollectedDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CollectedDeliveryList();
    }
  }
}
