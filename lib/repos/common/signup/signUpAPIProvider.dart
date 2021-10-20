import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';

class SignUpAPIProvider {
  //TODO:Ensure that both the device and hosting site are connected to the same network
  final Dio _dio = Client.init();

  Future<String> signUpUser(String email, String password, String role) async {
    try {
      Response response = await _dio.post(
        "information/category/product",
        data: {
          "email": email,
          "password": password,
          "role": role,
        },
      );
      if (response.statusCode == 200) {
        return "Sign up successfully initiated.";
      } else if (response.statusCode == 400) {
        return "This email address has already been registered";
      } else {
        return "Invalid request; cannot proceed with the signup";
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return "Error occurred during sign up, please try again.";
    }
  }
}
