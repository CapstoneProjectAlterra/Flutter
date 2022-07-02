import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/constants.dart';
import '../user_model.dart';

class UserApi {
  getAllUser() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      final response = await Dio().get(
        '$baseUrl/api/v1/user/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final userList = (response.data['data'] as List)
            .map(
              (e) => UserModel.fromJson(e),
            )
            .toList();
        return userList;
      }
    } on Exception catch (_) {
      Fluttertoast.showToast(msg: 'Ada masalah dengan koneksi ke server');
    }
  }

  editUser({UserModel? user, int? id}) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      await Dio().put(
        '$baseUrl/api/v1/user/$id/',
        data: user!.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode == 409) {
          throw "NIK Sudah Digunakan";
        }
      }
    }
  }
}
