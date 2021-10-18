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
    int deliveryAgentHomeAddressID,
  ) async {
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

  Future<OrderResponse> collectOrderProduct(
    int deliveryAgentID,
    int orderID,
  ) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/order-product/collect",
        data: {
          "deliveryAgentID": deliveryAgentID,
          "orderID": orderID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> transientOrder(
    int deliveryAgentID,
    int orderID,
  ) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/transient",
        data: {
          "deliveryAgentID": deliveryAgentID,
          "orderID": orderID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> transientCollectOrder(
    int deliveryAgentID,
    int orderID,
  ) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/transient_collect",
        data: {
          "deliveryAgentID": deliveryAgentID,
          "orderID": orderID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> shipOrder(
    int deliveryAgentID,
    int orderID,
  ) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/ship",
        data: {
          "deliveryAgentID": deliveryAgentID,
          "orderID": orderID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> deliverCashOrder({
    int deliveryAgentID,
    int orderID,
    double amountPaid,
    double checkoutDiscount,
    String currency,
    String customerEmail,
    int customerID,
  }) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/cash/deliver",
        data: {
          "deliveryAgentID": deliveryAgentID,
          "orderID": orderID,
          "amountPaid": amountPaid,
          "checkoutDiscount": checkoutDiscount,
          "currency": currency,
          "customerEmail": customerEmail,
          "customerID": customerID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> deliverOnlineOrder(
    int deliveryAgentID,
    int orderID,
  ) async {
    try {
      Response response = await _dio.post(
        "delivery-agent/order/online/deliver",
        data: {
          "deliveryAgentID": deliveryAgentID,
          "orderID": orderID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }
}
