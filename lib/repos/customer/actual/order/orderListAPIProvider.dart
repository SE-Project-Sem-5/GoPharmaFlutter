import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/order/orderList.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';
import 'package:go_pharma/repos/utilities.dart';

class OrderListAPIProvider {
  final Dio _dio = Client.init();

  Future<OrderList> getOrderByStatus(String status) async {
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

  Future<OrderList> getAllOrders() async {
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "customer/order/view",
      );
      print(response);
      print(response.data["data"]);
      return OrderList.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderList();
    }
  }

  Future<OrderResponse> cancelOrder(int orderID) async {
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

  Future<OrderResponse> cancelOrderProduct(int orderProductID) async {
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
          "orderProductID": orderProductID,
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
