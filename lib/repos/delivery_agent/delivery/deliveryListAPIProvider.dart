import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/collectedDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/pendingDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/reservedDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/returnCollectedOrderList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/returnReservedOrderList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/shippedOrderList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/transientCollectedList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/transientDelivery.dart';
import 'package:go_pharma/repos/utilities.dart';

//TODO: add error handling
class DeliveryListAPIProvider {
  final Dio _dio = Client.init();

  Future<PendingDeliveryList> getConfirmedDeliveryOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      _dio.options.headers.update("cookie", (c) => cookie);
      Response response = await _dio.post(
        "delivery-agent/order/view",
      );
      print(response);
      return PendingDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PendingDeliveryList();
    }
  }

  Future<ReservedDeliveryList> getReservedDeliveryOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/reserved/view",
      );
      print(response.data["data"]);
      return ReservedDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ReservedDeliveryList();
    }
  }

  Future<CollectedDeliveryList> getCollectedDeliveryOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/collected/view",
      );
      return CollectedDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CollectedDeliveryList();
    }
  }

  Future<TransientDeliveryList> getAllTransientOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/transient/view",
      );
      return TransientDeliveryList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TransientDeliveryList();
    }
  }

  Future<TransientCollectedList> getAllTransientCollectedOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/transient_collect/view",
      );
      return TransientCollectedList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return TransientCollectedList();
    }
  }

  Future<ShippedOrderList> getAllShippedOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
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
    int orderProductID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/order_product/reserve",
        data: {"orderProductID": orderProductID},
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> collectOrderProduct(
    int orderID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/order-product/collect",
        data: {
          "orderProductID": orderID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> transientOrder(
    int orderID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/transient",
        data: {
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
    int orderID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/transient_collect",
        data: {
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
    int orderID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/ship",
        data: {
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
    int orderID,
    double amountPaid,
    double checkoutDiscount,
    String currency,
    String customerEmail,
    int customerID,
  }) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/cash/deliver",
        data: {
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
    int orderID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/online/deliver",
        data: {
          "orderID": orderID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

//  RETURNED ORDERS
  Future<ReturnToBeReservedOrderList> getAllReturnedToBeReservedOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/return/view",
      );
      return ReturnToBeReservedOrderList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ReturnToBeReservedOrderList();
    }
  }

  Future<OrderResponse> reserveOrderForReturn(
    int orderProductID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/return/reserve",
        data: {
          "orderProductID": orderProductID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<ReturnCollectedOrderList> getAllReservedForCollectionOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.get(
        "delivery-agent/order/return/reserve/view",
      );
      return ReturnCollectedOrderList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ReturnCollectedOrderList();
    }
  }

  Future<OrderResponse> collectOrderForReturn(
    int orderProductID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/return/collect",
        data: {
          "orderProductID": orderProductID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<ReturnCollectedOrderList> getAllReturnCollectedOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.get(
        "delivery-agent/order/return/collected/view",
      );
      return ReturnCollectedOrderList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ReturnCollectedOrderList();
    }
  }

  Future<OrderResponse> returnOrderToCustomer(
    int orderProductID,
  ) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "delivery-agent/order/return/confirm",
        data: {
          "orderProductID": orderProductID,
        },
      );
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }
}
