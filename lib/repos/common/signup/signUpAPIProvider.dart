import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';

class SignUpAPIProvider {
  final Dio _dio = Client.init();

  Future<String> signUpUser(String email, String password, String role) async {
    try {
      Response response = await _dio.post(
        "auth/sign-up/user/step1",
        data: {
          "email": email,
          "password": password,
          "role": role,
        },
      );
      if (response.statusCode == 200) {
        return "Sign up successfully initiated.";
      }
    } catch (error, stacktrace) {
      if (error.response.statusCode == 400) {
        return "This email address has already been registered";
      } else {
        return "Invalid request; cannot proceed with the signup";
      }
    }
  }
}
