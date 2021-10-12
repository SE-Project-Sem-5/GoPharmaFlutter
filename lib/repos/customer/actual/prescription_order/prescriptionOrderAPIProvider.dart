import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';
import 'package:go_pharma/repos/customer/actual/prescription_order/prescriptionOrder.dart';

class PrescriptionOrderAPIProvider {
  final Dio _dio = Client.init();

  Future<OrderResponse> confirmPrescriptionOrder(
      PrescriptionOrder order, List<String> localPhotoPaths) async {
    try {
      FormData formData = new FormData.fromMap({
        "customerID": order.customerID,
        "zone": order.zone,
      });
      formData.files.addAll([
        for (var file in localPhotoPaths)
          ...{
            MapEntry(
              "prescriptions",
              await MultipartFile.fromFile(
                file,
                filename: "file1",
              ),
            )
          }.toList()
      ]);
      Response response = await _dio.post(
        "customer/order/prescription/confirm",
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
}
