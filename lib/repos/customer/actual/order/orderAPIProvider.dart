import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/order/order.dart';

class OrderAPIProvider {
  final Dio _dio = Client.init();

  Future<OrderList> getProcessingOrders(int customerID) async {
    try {
      Response response = await _dio.post(
        "customer/order/processing/view",
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

  Future<OrderList> getCompletedOrders(int customerID) async {
    try {
      Response response = await _dio.post(
        "customer/order/delivered/view",
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
