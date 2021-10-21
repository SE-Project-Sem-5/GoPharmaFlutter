import 'dart:io';
import "package:dio/dio.dart";
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:go_pharma/config/url.dart';
import 'package:cookie_jar/cookie_jar.dart';

class Client {
  static final CookieJar cookieJar = new CookieJar();
  String cookie;

  static Dio init() {
    Dio _dio = new Dio();
    _dio.options.baseUrl = URL.baseURL;
    _dio.interceptors.add(CookieManager(cookieJar));
    print("Dio gotten");
    return _dio;
  }

  static saveCookie(String cookie) {
    List<Cookie> cookies = [];
    cookies.add(new Cookie("accessToken", cookie));
    Client.cookieJar.saveFromResponse(Uri.parse(URL.baseURL), cookies);
  }

  static Future<Cookie> getCookie() async {
    List<Cookie> cookies =
        await cookieJar.loadForRequest(Uri.parse(URL.baseURL));
    return cookies[0];
  }
}
