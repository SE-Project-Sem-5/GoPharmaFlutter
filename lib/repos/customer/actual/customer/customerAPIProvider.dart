import 'package:dio/dio.dart';
import 'package:go_pharma/repos/customer/actual/customer/user.dart';

class UserAPIProvider {
  //TODO:Ensure that both the device and hosting site are connected to the same network
  final String _endpoint = "http://192.168.1.2:8000/api";
  final Dio _dio = Dio();

  Future<User> getUser() async {
    try {
      Response response =
          await _dio.get("http://192.168.1.2:8000/api/customer/test");
      print(response.data["data"]["data"]);
      return User.fromJson(response.data['data']["data"]);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return User();
    }
  }
}
