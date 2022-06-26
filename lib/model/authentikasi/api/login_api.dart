import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine_booking/model/authentikasi/login_model.dart';

class LoginApi {
  Future<String> postLogin({LoginModel? login}) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? token;
    try {
      final response = await Dio().post(
          "http://ec2-3-237-105-224.compute-1.amazonaws.com:8080/api/v1/auth/login",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: login!.toJson());
      if (response.statusCode == 200) {
        await prefs.setString("token", response.data['data']["token"]);

        token = response.data['data']['token'];
      }
    } catch (e) {
      if (e is DioError) {
        // throw e.response!.data['error']['message'];
        throw 'Something Wrong';
      }
    }
    return token!;
  }
}
