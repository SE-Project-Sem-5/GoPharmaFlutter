import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/deliveryDetails.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/normalOrder.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderPriceInformation.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';
import 'package:go_pharma/repos/utilities.dart';

class ProgressingOrderAPIProvider {
  final Dio _dio = Client.init();

  Future<OrderPriceInformation> getDeliveryChargeForNormalOrder(
      DeliveryDetails delivery) async {
    print(delivery);
    final cookie = await Utilities.getCookie();
    if (_dio.options.headers.containsKey("cookie")) {
      _dio.options.headers.update("cookie", (c) => cookie);
    } else {
      _dio.options.headers.putIfAbsent("cookie", () => cookie);
    }

    try {
      Response response = await _dio.post(
        "customer/order/delivery",
        data: delivery.toJson(),
      );
      print(response);
      print(response.data);
      return OrderPriceInformation.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderPriceInformation();
    }
  }

  Future<OrderResponse> confirmNormalCashPrescriptionlessOrder(
      NormalOrder order) async {
    try {
      final cookie = await Utilities.getCookie();

      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "customer/order/normal/cash/confirm",
        data: order.toJson(),
      );
      print(response);
      print(response.data["data"]);
      return OrderResponse.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> confirmNormalCashOrderWithPrescriptions(
      NormalOrder order, List<String> localPhotoPaths) async {
    var products = [];
    for (var product in order.products) {
      products.add(product.toJson());
    }
    print(products);
    final cookie = await Utilities.getCookie();

    if (_dio.options.headers.containsKey("cookie")) {
      _dio.options.headers.update("cookie", (c) => cookie);
    } else {
      _dio.options.headers.putIfAbsent("cookie", () => cookie);
    }
    FormData formData = new FormData.fromMap({
      "totalPrice": order.totalPrice.toString(),
      "deliveryCharge": order.deliveryCharge.toString(),
      "type": "mobile",
      "totalToBePaid": (order.totalPrice + order.deliveryCharge).toString(),
      "orderType": "normal",
      "address": order.address.toJson(),
      "products": products,
      "hasPrescriptions": "true",
    });

    formData.files.addAll([
      for (var file in localPhotoPaths)
        ...{
          MapEntry("prescriptions",
              await MultipartFile.fromFile(file, filename: "file1"))
        }.toList()
    ]);

    try {
      Response response = await _dio.post(
        "customer/order/normal/cash/confirm",
        data: formData,
      );
      print(response);
      print(response.data["data"]);
      return OrderResponse.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> confirmNormalOnlinePrescriptionlessOrder(
      NormalOrder order) async {
    print(order);
    try {
      final cookie = await Utilities.getCookie();
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "customer/order/normal/online/data/confirm",
        data: order.toJson(),
      );
      print(response);
      print(response.data["data"]);
      return OrderResponse.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderResponse> confirmNormalOnlineOrderWithPrescriptions(
      NormalOrder order, List<String> localPhotoPaths) async {
    var products = [];
    for (var product in order.products) {
      products.add(product.toJson());
    }
    print(products);
    final cookie = await Utilities.getCookie();
    if (_dio.options.headers.containsKey("cookie")) {
      _dio.options.headers.update("cookie", (c) => cookie);
    } else {
      _dio.options.headers.putIfAbsent("cookie", () => cookie);
    }
    FormData formData = new FormData.fromMap({
      "totalPrice": order.totalPrice.toString(),
      "deliveryCharge": order.deliveryCharge.toString(),
      "type": "mobile",
      "totalToBePaid": (order.totalPrice + order.deliveryCharge).toString(),
      "orderType": "normal",
      "address": order.address.toJson(),
      "products": products,
      "hasPrescriptions": "true",
    });
    formData.files.addAll([
      for (var file in localPhotoPaths)
        ...{
          MapEntry("prescriptions",
              await MultipartFile.fromFile(file, filename: "file1"))
        }.toList()
    ]);
    try {
      Response response = await _dio.post(
        "customer/order/normal/online/data/confirm",
        data: formData,
      );
      print(response);
      print(response.data["data"]);
      return OrderResponse.fromJson(response.data["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OrderResponse();
    }
  }

  Future<OrderPriceInformation> confirmPrescriptionOrder(
      DeliveryDetails delivery) async {
    print(delivery);
    try {
      final cookie = await Utilities.getCookie();

      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
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
