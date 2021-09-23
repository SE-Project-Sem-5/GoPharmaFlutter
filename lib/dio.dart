import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio();
  static final baseURL = "http://localhost:8000/api";

  static getData(String endpoint) async {
    try {
      Response response = await dio.get(baseURL + endpoint);
      return response;
    } on DioError catch (error) {
      if (error.response != null) {
        print('Dio error!');
        print('STATUS: ${error.response?.statusCode}');
        print('DATA: ${error.response?.data}');
        print('HEADERS: ${error.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(error.message);
      }
    }
  }
}
