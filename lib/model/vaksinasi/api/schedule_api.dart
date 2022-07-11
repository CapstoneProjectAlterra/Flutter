import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../schedule_model.dart';

class ScheduleApi {
  getAllSchedules() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      final response = await Dio().get(
        'http://ec2-3-237-105-224.compute-1.amazonaws.com:8080/api/v1/schedule',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final schedules = (response.data['data'] as List)
            .map((e) => ScheduleModel.fromJson(e))
            .toList();
        return schedules;
      }
    } on Exception catch (_) {
      throw "Gagal mendapatkan data schedule";
    }
  }
}
