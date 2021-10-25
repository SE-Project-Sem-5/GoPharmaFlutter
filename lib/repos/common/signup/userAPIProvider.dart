import 'package:dio/dio.dart';
import 'package:go_pharma/providers/api_client.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
import 'package:go_pharma/repos/common/signup/user.dart';
import 'loginResponse.dart';

class UserAPIProvider {
  final Dio _dio = Client.init();

  Future<Map<String, String>> signUpUser({
    String email,
    String password,
    String role,
  }) async {
    try {
      Response response = await _dio.post(
        "auth/sign-up/user/step1",
        data: {
          "email": email,
          "password": password,
          "role": role,
        },
      );
      return {"success": "Sign up successfully initiated."};
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      print("This email has already been registered");
      return {"error": "This email has already been registered"};
    }
  }

  Future<Map<String, dynamic>> loginUser({
    String email,
    String password,
  }) async {
    try {
      Response response = await _dio.post(
        "auth/login",
        data: {
          "email": email,
          "password": password,
        },
      );
      print(response.data);
      print(response.headers);
      print(LoginResponse.fromJson(response.data));
      print(response.headers["set-cookie"]);
      return {
        "data": LoginResponse.fromJson(response.data),
        "cookie": response.headers["set-cookie"],
      };
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {
        "error": "This email address has already been registered",
      };
    }
  }

  Future<Map<String, dynamic>> signUpCustomer({
    String firstName,
    String lastName,
    String streetAddress,
    String city,
    String district,
    String province,
    String birthDate,
    String gender,
    String contactNumber,
    String cookie,
  }) async {
    try {
      _dio.options.headers.putIfAbsent("cookie", () => cookie);
      Response response = await _dio.post(
        "auth/sign-up/customer/step2",
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "streetAddress": streetAddress,
          "city": city,
          "district": district,
          "province": province,
          "birthDate": birthDate,
          "gender": gender,
          "contactNumber": contactNumber
        },
      );
      return {
        "success": "Sign up successfully initiated.",
        "cookie": response.headers["set-cookie"],
      };
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {"error": "Sign Up Error"};
    }
  }

  Future<Map<String, dynamic>> verifyEmail() async {
    try {
      Response response = await _dio.post(
        "auth/sign-up/verify-email",
        //TODO: add userID and passcode manually
        data: {
          "userID": "Phone number",
          "passcode": "",
        },
      );
      return {
        "data": "Your email is successfully verified",
        "cookie": response.headers["set-cookie"],
      };
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {
        "error": "Something went wrong, try again later",
      };
    }
  }

  Future<Map<String, String>> generateTwoFA({
    String cookie,
  }) async {
    try {
      _dio.options.headers.update(
          "cookie",
          (v) =>
              "accessToken=s%3AeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEyLCJzdGF0ZSI6InZlcmlmaWVkIiwibWVzc2FnZSI6bnVsbCwidGhpcmRQYXJ0eSI6ZmFsc2UsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTYzNTEzMjE3NCwiZXhwIjo0MjI3MTMyMTc0fQ.sG2LOpVxS4AjMlC1khGnVcBEt8WFKNX7Lt_WQssAYMg.nhq6in0H6nNrtjhKBcclDlYrVEuLVPLOB4PqSx78yao; Expires=Wed, 24 Nov 2021 03:22:54 GMT; Path=/; HttpOnly; SameSite=Strict; Domain=localhost");

      Response response = await _dio.post(
        "auth/two-factor/generate",
        data: {
          "medium": "email",
        },
      );
      return {"data": "2FA generated"};
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {
        "error": "Something went wrong, try again later",
      };
    }
  }

  Future<Map<String, dynamic>> verifyTwoFA({
    String twoFA,
    String cookie,
  }) async {
    try {
      if (_dio.options.headers.containsKey("cookie")) {
        _dio.options.headers.update("cookie", (c) => cookie);
      } else {
        _dio.options.headers.putIfAbsent("cookie", () => cookie);
      }
      Response response = await _dio.post(
        "auth/two-factor/verify",
        data: {
          "verificationCode": twoFA,
          "scope": "register",
        },
      );
      print(response.headers["set-cookie"][0]);
      return {
        "data": "Your email is successfully verified",
        "cookie": response.headers["set-cookie"],
      };
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {
        "error": "Something went wrong, try again later",
      };
    }
  }

  Future<Map<String, dynamic>> disableTwoFA({String cookie}) async {
    try {
      _dio.options.headers.update(
          "cookie",
          (v) =>
              "accessToken=s%3AeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEyLCJzdGF0ZSI6InZlcmlmaWVkIiwibWVzc2FnZSI6bnVsbCwidGhpcmRQYXJ0eSI6ZmFsc2UsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTYzNTEzMjE3NCwiZXhwIjo0MjI3MTMyMTc0fQ.sG2LOpVxS4AjMlC1khGnVcBEt8WFKNX7Lt_WQssAYMg.nhq6in0H6nNrtjhKBcclDlYrVEuLVPLOB4PqSx78yao; Expires=Wed, 24 Nov 2021 03:22:54 GMT; Path=/; HttpOnly; SameSite=Strict; Domain=localhost");

      Response response = await _dio.get(
        "auth/two-factor/disable",
      );
      return {"data": "Your email is successfully verified"};
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {
        "error": "Something went wrong, try again later",
      };
    }
  }

  Future<Map<String, dynamic>> getCurrentUser(String cookie) async {
    try {
      _dio.options.headers.update("cookie", (v) => cookie);
      print(_dio.options.headers);
      Response response = await _dio.get("user/details");
      print(response.data);
      return {"user": User.fromJson(response.data)};
    } catch (error, stacktrace) {
      // print("Exception occured: $error stackTrace: $stacktrace");
      print("error in login process - didnt complete sign up");
      return {"error": "Something went wrong, try again later"};
    }
  }

  Future<Map<String, dynamic>> getAllCities() async {
    try {
      Response response = await _dio.get(
        "information/cities",
      );
      return {"data": CityList.fromJson(response.data)};
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return {
        "error": "Something went wrong, try again later",
      };
    }
  }
}
