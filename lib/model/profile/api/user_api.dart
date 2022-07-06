import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/constants.dart';
import '../user_model.dart';

class UserApi {
  getAllFamilies() async {
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
        final familyList = (response.data['data'] as List)
            .map(
              (e) => UserModel.fromJson(e),
            )
            .toList();
        return familyList;
      }
    } on Exception catch (_) {}
  }

  editUser({int? id, UserModel? profile}) async {
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
        throw e.response!.data['error'].toString();
      }
    }
  }

  addFamily({UserModel? profile}) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      await Dio().post(
        '$baseUrl/api/v1/family/',
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
        throw e.response!.data['error'].toString();
      }
    }
  }

  editFamily({UserModel? profile, int? id}) async {
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
        throw e.response!.data['error'].toString();
      }
    }
  }
}
