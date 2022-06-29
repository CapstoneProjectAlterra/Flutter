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
        '$baseUrl/api/v1/family/',
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
      Fluttertoast.showToast(msg: 'Failed Fetch');
    }
  }

  editProfile({int? id, UserModel? profile}) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      await Dio().put(
        '$baseUrl/api/v1/family/$id',
        data: profile!.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } catch (e) {
      if (e is DioError) {
        throw e.response!.data['error'];
      } else {
        throw 'something wrong';
      }
    }
  }
}
