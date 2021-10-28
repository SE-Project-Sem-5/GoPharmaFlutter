import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/order/orderList.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';
import 'package:go_pharma/repos/utilities.dart';

class OrderListAPIProvider {
  final Dio _dio = Client.init();

  Future<OrderList> getOrderByStatus(int customerID, String status) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "customer/order/view/status",
        data: {
          "customerID": customerID,
          "status": status,
        },
      );
      print(response);
      print(response.data["data"]);
      return OrderList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderList();
    }
  }

  Future<OrderList> getAllOrders(int customerID) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "customer/order/view",
        data: {"customerID": customerID.toString()},
      );
      print(response);
      print(response.data["data"]);
      return OrderList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderList();
    }
  }

  Future<OrderResponse> cancelOrder(int customerID, int orderID) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "customer/order/normal/cancel",
        data: {
          "customerID": customerID.toString(),
          "orderID": orderID.toString(),
        },
      );
      print(response);
      print(response.data["data"]);
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> cancelOrderProduct(
      int customerID, int orderProductID) async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "customer/order/product/normal/cancel",
        data: {
          "customerID": customerID.toString(),
          "orderProductID": orderProductID.toString(),
        },
      );
      print(response);
      print(response.data["data"]);
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }
}
