import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/constants.dart';
import '../family_model.dart';

class FamilyApi {
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
              (e) => FamilyModel.fromJson(e),
            )
            .toList();
        return familyList;
      }
    } on Exception catch (_) {}
  }

  editFamily({int? id, FamilyModel? profile}) async {
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
