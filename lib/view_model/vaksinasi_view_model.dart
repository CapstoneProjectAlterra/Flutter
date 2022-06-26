import 'package:flutter/material.dart';
import 'package:vaccine_booking/model/vaksinasi/health_facility_model.dart';

import '../model/vaksinasi/api/health_facility_api.dart';

class VaksinasiViewModel extends ChangeNotifier {
  final vaksinasiApi = HealthFacilityApi();
  List<HealthFacilityModel> facilityList = [];
  List<HealthFacilityModel> result = [];
  List<HealthFacilityModel> moreResult = [];

  getAllHealthFacilities() async {
    final getAllFacilities = await vaksinasiApi.getAllHealthFacilities();

    facilityList = getAllFacilities;

    notifyListeners();
  }

  searchFacility({String? query}) async {
    if (query == "") {
      return result = facilityList;
    } else if (query != null) {
      return result = facilityList
          .where(
            (element) =>
                element.province!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                element.city!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                element.postalCode!.toString().contains(query),
          )
          .toList();
    }
    notifyListeners();
  }

  searchMoreFacility({String? query}) async {
    if (query == "") {
      return moreResult = result;
    } else if (query != null) {
      return moreResult = result
          .where(
            (element) =>
                element.province!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                element.city!.toLowerCase().contains(
                      query.toLowerCase(),
                    ) ||
                element.postalCode!.toString().contains(query),
          )
          .toList();
    }
    notifyListeners();
  }
}
