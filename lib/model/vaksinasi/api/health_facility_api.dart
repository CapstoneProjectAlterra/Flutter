import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vaccine_booking/model/vaksinasi/health_facility_model.dart';

class HealthFacilityApi {
  getAllHealthFacilities() async {
    try {
      final response = await Dio().get(
        'http://ec2-3-237-105-224.compute-1.amazonaws.com:8080/api/v1/facility/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      final healthFacilitiesList = (response.data['data'] as List)
          .map((e) => HealthFacilityModel.fromJson(e))
          .toList();
      return healthFacilitiesList;
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
