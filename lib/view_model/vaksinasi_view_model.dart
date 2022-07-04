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
  List<ScheduleModel> filterScheduleSessionList = [];
  String vaccine1 = '-';
  String vaccine2 = '-';
  String vaccine3 = '-';
  String vaccine4 = '-';
  String timeStart1 = '00:00';
  String timeStart2 = '00:00';
  String timeStart3 = '00:00';
  String timeStart4 = '00:00';
  String timeEnd1 = '00:00';
  String timeEnd2 = '00:00';
  String timeEnd3 = '00:00';
  String timeEnd4 = '00:00';
  String dosis1 = 'Dosis_0';
  String dosis2 = 'Dosis_0';
  String dosis3 = 'Dosis_0';
  String dosis4 = 'Dosis_0';
  int stock1 = 0;
  int stock2 = 0;
  int stock3 = 0;
  int stock4 = 0;

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

  filterScheduleSession(String date, int id) {
    filterScheduleSessionList = filterScheduleList
        .where(
          (element) =>
              element.vaccinationDate.contains(date) &&
              element.facility['id'] == id,
        )
        .toList();
  }

  filterSelectVaccine() {
    if (filterScheduleSessionList.isEmpty) {
      vaccine1 = '-';
      vaccine2 = '-';
      vaccine3 = '-';
      vaccine4 = '-';
      timeStart1 = '00:00';
      timeStart2 = '00:00';
      timeStart3 = '00:00';
      timeStart4 = '00:00';
      timeEnd1 = '00:00';
      timeEnd2 = '00:00';
      timeEnd3 = '00:00';
      timeEnd4 = '00:00';
      dosis1 = 'Dosis_0';
      dosis2 = 'Dosis_0';
      dosis3 = 'Dosis_0';
      dosis4 = 'Dosis_0';
      stock1 = 0;
      stock2 = 0;
      stock3 = 0;
      stock4 = 0;
    }
    if (filterScheduleSessionList.length == 1) {
      vaccine1 = filterScheduleSessionList[0].vaccine['vaccine_name'];
      dosis1 = filterScheduleSessionList[0].dose;
      timeStart1 = filterScheduleSessionList[0].operationalHourStart;
      timeEnd1 = filterScheduleSessionList[0].operationalHourStart;
      stock1 = filterScheduleSessionList[0].quota;

      timeStart2 = '00:00';
      timeEnd2 = '00:00';
      vaccine2 = '-';
      dosis2 = 'Dosis_0';
      stock2 = 0;

      timeStart3 = '00:00';
      timeEnd3 = '00:00';
      vaccine3 = '-';
      dosis3 = 'Dosis_0';
      stock3 = 0;

      timeStart4 = '00:00';
      timeEnd4 = '00:00';
      vaccine4 = '-';
      dosis4 = 'Dosis_0';
      stock4 = 0;
    }
    if (filterScheduleSessionList.length == 2) {
      vaccine1 = filterScheduleSessionList[0].vaccine['vaccine_name'];
      dosis1 = filterScheduleSessionList[0].dose;
      timeStart1 = filterScheduleSessionList[0].operationalHourStart;
      timeEnd1 = filterScheduleSessionList[0].operationalHourStart;
      stock1 = filterScheduleSessionList[0].quota;

      vaccine2 = filterScheduleSessionList[1].vaccine['vaccine_name'];
      dosis2 = filterScheduleSessionList[1].dose;
      timeStart2 = filterScheduleSessionList[1].operationalHourStart;
      timeEnd2 = filterScheduleSessionList[1].operationalHourStart;
      stock2 = filterScheduleSessionList[1].quota;

      timeStart3 = '0';
      timeEnd3 = '0';
      vaccine3 = '-';
      dosis3 = 'Dosis_0';
      stock3 = 0;

      timeStart4 = '00:00';
      timeEnd4 = '00:00';
      vaccine4 = '-';
      dosis4 = 'Dosis_0';
      stock4 = 0;
    }
    if (filterScheduleSessionList.length == 3) {
      vaccine1 = filterScheduleSessionList[0].vaccine['vaccine_name'];
      dosis1 = filterScheduleSessionList[0].dose;
      timeStart1 = filterScheduleSessionList[0].operationalHourStart;
      timeEnd1 = filterScheduleSessionList[0].operationalHourStart;
      stock1 = filterScheduleSessionList[0].quota;

      vaccine2 = filterScheduleSessionList[1].vaccine['vaccine_name'];
      dosis2 = filterScheduleSessionList[1].dose;
      timeStart2 = filterScheduleSessionList[1].operationalHourStart;
      timeEnd2 = filterScheduleSessionList[1].operationalHourStart;
      stock2 = filterScheduleSessionList[1].quota;

      vaccine3 = filterScheduleSessionList[2].vaccine['vaccine_name'];
      dosis3 = filterScheduleSessionList[2].dose;
      timeStart3 = filterScheduleSessionList[2].operationalHourStart;
      timeEnd3 = filterScheduleSessionList[2].operationalHourStart;
      stock3 = filterScheduleSessionList[2].quota;

      timeStart4 = '00:00';
      timeEnd4 = '00:00';
      vaccine4 = '-';
      dosis4 = 'Dosis_0';
      stock4 = 0;
    }

    if (filterScheduleSessionList.length == 4) {
      vaccine1 = filterScheduleSessionList[0].vaccine['vaccine_name'];
      dosis1 = filterScheduleSessionList[0].dose;
      timeStart1 = filterScheduleSessionList[0].operationalHourStart;
      timeEnd1 = filterScheduleSessionList[0].operationalHourStart;
      stock1 = filterScheduleSessionList[0].quota;

      vaccine2 = filterScheduleSessionList[1].vaccine['vaccine_name'];
      dosis2 = filterScheduleSessionList[1].dose;
      timeStart2 = filterScheduleSessionList[1].operationalHourStart;
      timeEnd2 = filterScheduleSessionList[1].operationalHourStart;
      stock2 = filterScheduleSessionList[1].quota;

      vaccine3 = filterScheduleSessionList[2].vaccine['vaccine_name'];
      dosis3 = filterScheduleSessionList[2].dose;
      timeStart3 = filterScheduleSessionList[2].operationalHourStart;
      timeEnd3 = filterScheduleSessionList[2].operationalHourStart;
      stock3 = filterScheduleSessionList[2].quota;

      vaccine4 = filterScheduleSessionList[3].vaccine['vaccine_name'];
      dosis4 = filterScheduleSessionList[3].dose;
      timeStart4 = filterScheduleSessionList[3].operationalHourStart;
      timeEnd4 = filterScheduleSessionList[3].operationalHourStart;
      stock4 = filterScheduleSessionList[3].quota;
    }
  }
}
