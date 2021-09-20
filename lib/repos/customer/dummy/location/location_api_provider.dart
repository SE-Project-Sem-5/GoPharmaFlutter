import 'package:dio/dio.dart';
import 'package:go_pharma/repos/customer/dummy/location/location_model.dart';

class LocationApiProvider {
  final Dio _dio = Dio();
  //TODO:Ensure that both the device and hosting site are connected to the same network
  final String _endpoint = "http://localhost:8000/api";
  final String _districtsEndpoint = "http://192.168.1.2:8000/api/districts";

  Future<List<String>> getDistricts() async {
    try {
      Response response = await _dio.get(_districtsEndpoint);
      return Location.fromJson(response.data['data']).districts;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [];
    }
  }
}
