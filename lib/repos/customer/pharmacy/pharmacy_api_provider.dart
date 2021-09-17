import 'package:dio/dio.dart';

class PharmacyApiProvider {
  final String _endpoint = "https://localhost:8000/api/";
  final String _locationEndpoint = "https://localhost:8000/api/districts";
  final Dio _dio = Dio();
}
