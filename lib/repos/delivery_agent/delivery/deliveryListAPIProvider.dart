import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/deliveryListModel.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/reservedDelivery.dart';

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
      print("==============");
      print(response.data["data"]);
      return PendingDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PendingDeliveryList();
    }
  }

  Future<ReservedDeliveryList> getReservedDeliveryOrders(
      int deliveryAgentID) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/reserved/view",
        data: {
          "deliveryAgentID": deliveryAgentID,
        },
      );
      print(response);
      print("==============");
      print(response.data["data"]);
      return ReservedDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ReservedDeliveryList();
    }
  }
}
