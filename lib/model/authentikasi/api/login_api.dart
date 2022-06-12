import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine_booking/model/authentikasi/login_model.dart';

class LoginApi {
  Future<String> postLogin({LoginModel? login}) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    try {
      final response = await Dio().post(
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB-YnxQs6Jv5325we9Vt6X-48rLF5ul_Tc",
          data: login!.toJson());
      if (response.statusCode == 200) {
        await prefs.setString("tokenId", response.data["idToken"]);

        token = response.data["idToken"];
      }
    } catch (e) {
      if (e is DioError) {
        throw e.response!.data['error']['message'];
      }
    }
    return token!;
  }
}
