import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/collectedDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/pendingDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/reservedDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/shippedOrderList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/transientCollectedList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/transientDelivery.dart';

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

  Future<TransientDeliveryList> getAllTransientOrders() async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/transient/view",
      );
      return TransientDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TransientDeliveryList();
    }
  }

  Future<TransientCollectedList> getAllTransientCollectedOrders(
    int deliveryAgentID,
  ) async {
    try {
      Response response = await _dio.post(
          "delivery-agent/order/transient_collect/view",
          data: {"deliveryAgentID": deliveryAgentID});
      return TransientCollectedList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TransientCollectedList();
    }
  }

  Future<ShippedOrderList> getAllShippedOrders() async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/ship/view",
      );
      return ShippedOrderList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ShippedOrderList();
    }
  }

  Future<OrderResponse> reserveOrderProduct(
    int deliveryAgentID,
    int orderProductID,
  ) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/order_product/reserve",
        data: {
          "deliveryAgentID": deliveryAgentID,
          "orderProductID": orderProductID
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> collectOrderProduct() async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/ship/view",
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> transientOrder() async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/ship/view",
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> transientCollectOrder() async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/ship/view",
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> shipOrder() async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/ship/view",
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> deliverOrder() async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/ship/view",
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }
}
