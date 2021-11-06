import "package:dio/dio.dart";
import 'package:go_pharma/config/url.dart';

class Client {
  String cookie;

  static Dio init() {
    Dio _dio = new Dio();
    _dio.options.baseUrl = URL.baseURL;
    print("Dio gotten");
    return _dio;
  }
}
