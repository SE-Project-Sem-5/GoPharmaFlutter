import "package:dio/dio.dart";
import 'package:go_pharma/config/url.dart';

class Client {
  static Dio init() {
    Dio _dio = new Dio();
    _dio.options.baseUrl = URL.baseURL;
    return _dio;
  }
}
