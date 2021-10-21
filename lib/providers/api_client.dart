import "package:dio/dio.dart";
import 'package:go_pharma/config/url.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class Client {
  static Dio init() {
    Dio _dio = new Dio();
    var cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(cookieJar));
    _dio.options.baseUrl = URL.baseURL;
    return _dio;
  }
}
