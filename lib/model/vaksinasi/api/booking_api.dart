import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine_booking/model/vaksinasi/booking_model.dart';

import '../../../components/constants.dart';

class BookingApi {
  postBooking({BookingModel? booking}) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      await Dio().post(
        "$baseUrl/api/v1/booking/",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: booking!.toJson(),
      );
    } on Exception catch (_) {}
  }
}
