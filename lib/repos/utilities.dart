import 'package:shared_preferences/shared_preferences.dart';

class Utilities {
  static Future<String> getCookie() async {
    var prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString('cookie');
    return cookie;
  }
}
