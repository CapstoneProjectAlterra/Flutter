import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaccine_booking/model/profile/api/user_api.dart';

import '../model/profile/user_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final userApi = UserApi();
  List<UserModel> userList = [];
  List<UserModel> userData = [];
  final itemsGender = ['laki_laki', 'perempuan'];
  final itemsStatus = ['ayah', 'ibu', 'anak'];

  getAllUser() async {
    final getAllFamilies = await userApi.getAllUser();
    userList = getAllFamilies;
    notifyListeners();
  }

  nameUser() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    userData = userList
        .where(
          (element) => element.nik!.contains(prefs.getString('nik')!),
        )
        .toList();
    notifyListeners();
  }

  editProfile(UserModel profile, int id) async {
    await userApi.editProfile(profile: profile, id: id);
    notifyListeners();
  }
}
