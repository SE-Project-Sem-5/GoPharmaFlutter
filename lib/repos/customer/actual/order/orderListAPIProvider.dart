import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/order/orderList.dart';

class OrderListAPIProvider {
  final Dio _dio = Client.init();

  Future<OrderList> getOrderByStatus(int customerID, String status) async {
    try {
      Response response = await _dio.post(
        "customer/order/view/status",
        data: {
          "customerID": customerID,
          "status": status,
        },
      );
      print(response);
      print(response.data["data"]);
      return OrderList.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderList();
    }
  }

  Future<OrderList> getAllOrders(int customerID) async {
    try {
      Response response = await _dio.post(
        "customer/order/view",
        data: {"customerID": customerID},
      );
      print(response);
      print(response.data["data"]);
      return OrderList.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderList();
    }
  }
}
