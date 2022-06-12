import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine_booking/model/authentikasi/api/login_api.dart';
import 'package:vaccine_booking/model/authentikasi/login_model.dart';

class AuthViewModel extends ChangeNotifier {
  SharedPreferences? _prefs;
  final loginApi = LoginApi();
  String token = '';

  bool get isAuth {
    return token.isNotEmpty;
  }

  deleteToken() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs!.clear();
    notifyListeners();
  }

  getToken() async {
    _prefs = await SharedPreferences.getInstance();
    if (_prefs!.getString('tokenId') != null) {
      token = _prefs!.getString('tokenId')!;
    }
    notifyListeners();
  }

  postLogin(LoginModel login) async {
    final postLogin = await loginApi.postLogin(login: login);
    token = postLogin;
    notifyListeners();
  }
}
