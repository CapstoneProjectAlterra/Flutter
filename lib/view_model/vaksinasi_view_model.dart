import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vaccine_booking/model/vaksinasi/api/schedule_api.dart';
import 'package:vaccine_booking/model/vaksinasi/health_facility_model.dart';
import 'package:vaccine_booking/model/vaksinasi/schedule_model.dart';

import '../model/vaksinasi/api/health_facility_api.dart';

class VaksinasiViewModel extends ChangeNotifier {
  final vaksinasiApi = HealthFacilityApi();
  final scheduleApi = ScheduleApi();
  List<HealthFacilityModel> facilityList = [];
  List<HealthFacilityModel> result = [];
  List<HealthFacilityModel> moreResult = [];
  List<ScheduleModel> scheduleList = [];
  List<ScheduleModel> filterScheduleList = [];

  getAllHealthFacilities() async {
    final getAllFacilities = await vaksinasiApi.getAllHealthFacilities();

    facilityList = getAllFacilities;

    notifyListeners();
  }

  searchFacility({String? query}) async {
    if (query == "") {
      return result = facilityList;
    } else if (query != null) {
      result = facilityList
          .where(
            (element) =>
                element.province!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                element.city!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                element.postalCode!.toString().contains(query) ||
                element.facilityName!.toLowerCase().contains(
                      query.toLowerCase(),
                    ),
          )
          .toList();
      if (result.isEmpty) {
        Fluttertoast.showToast(msg: "Pencarian Tidak Ditemukan");
      }
    }
    notifyListeners();
  }

  searchMoreFacility({String? query, String? query2}) async {
    if (query2 == "") {
      result = facilityList;
    } else if (query == "") {
      moreResult = result;
    } else if (query != null) {
      moreResult = result
          .where(
            (element) =>
                element.province!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                element.city!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                element.postalCode!.toString().contains(query) ||
                element.facilityName!.toLowerCase().contains(
                      query.toLowerCase(),
                    ),
          )
          .toList();
      if (moreResult.isEmpty) {
        Fluttertoast.showToast(msg: "Pencarian Tidak Ditemukan");
      }
    }
  }

  getAllSchedule() async {
    final getAllSchedule = await scheduleApi.getAllSchedules();
    scheduleList = getAllSchedule;
    notifyListeners();
  }

  filterSchedule(int id) {
    filterScheduleList = scheduleList
        .where((element) => element.facility.containsValue(id))
        .toList();
  }
}
