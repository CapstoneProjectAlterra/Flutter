import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/profile/api/user_api.dart';
import '../model/profile/user_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final familyApi = UserApi();
  List<UserModel> familyList = [];
  List<UserModel> userData = [];
  List<UserModel> userFamily = [];

  final itemsGender = ['laki_laki', 'perempuan'];
  final itemsStatus = ['ayah', 'ibu', 'anak', 'saudara'];

  String name = '';
  String nik = '';
  String email = '';
  String phone = '';
  String dateBirth = '';
  String address = '';
  String idCardAddress = '';
  String placeBirth = '';
  String gender = '';
  String status = '';

  getAllFamilies() async {
    final getAllFamilies = await familyApi.getAllFamilies();
    familyList = getAllFamilies;
    notifyListeners();
  }

  filterUserFamily({int? profile}) {
    if (userData.isNotEmpty) {
      userFamily = familyList
          .where(
            (element) => element.profile!.containsValue(profile!),
          )
          .toList();
    }
  }

  filterUser() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    final filterUser = familyList
        .where(
          (element) => element.nik!.contains(prefs.getString('nik')!),
        )
        .toList();
    userData = filterUser;
    if (filterUser.isEmpty) {
      dateBirth = 'Tanggal Lahir';
      name = 'Nama Lengkap Pemesan';
      nik = 'Nomor NIK';
      placeBirth = 'Tempat Lahir';
      email = 'Alamat Email';
      phone = 'No hp';
      idCardAddress = 'Alamat Berdasarkan KTP';
      address = 'Alamat Domisili';
      status = 'Status Keluarga';
      gender = 'Gender';
    } else {
      if (userData[0].dateBirth != null) {
        dateBirth = userData[0].dateBirth!;
      } else {
        dateBirth = 'Tanggal Lahir';
      }
      if (userData[0].name != null) {
        name = userData[0].name!;
      } else {
        name = 'Nama Lengkap Pemesan';
      }
      if (userData[0].nik != null) {
        nik = userData[0].nik!;
      } else {
        nik = 'Nomor NIK';
      }
      if (userData[0].placeBirth != null) {
        placeBirth = userData[0].placeBirth!;
      } else {
        placeBirth = 'Tempat Lahir';
      }
      if (userData[0].email != null) {
        email = userData[0].email!;
      } else {
        email = 'Alamat Email';
      }
      if (userData[0].phone != null) {
        phone = userData[0].phone!;
      } else {
        phone = 'No hp';
      }
      if (userData[0].idCardAddress != null) {
        idCardAddress = userData[0].idCardAddress!;
      } else {
        idCardAddress = 'Alamat Berdasarkan KTP';
      }
      if (userData[0].address != null) {
        address = userData[0].address!;
      } else {
        address = 'Alamat Domisili';
      }
      if (userData[0].statusFamily != null) {
        status = userData[0].statusFamily!.toLowerCase();
      } else {
        status = 'Status Keluarga';
      }
      if (userData[0].gender != null) {
        gender = userData[0].gender!.toLowerCase();
      } else {
        gender = 'Gender';
      }
    }
    notifyListeners();
  }

  editFamily(UserModel profile, int id) async {
    await familyApi.editUser(profile: profile, id: id);
  }

  detailProfile() async {
    if (userData.isEmpty) {
      dateBirth = 'Tanggal Lahir';
      name = 'Nama Lengkap Pemesan';
      nik = 'Nomor NIK';
      placeBirth = 'Tempat Lahir';
      email = 'Alamat Email';
      phone = 'No hp';
      idCardAddress = 'Alamat Berdasarkan KTP';
      address = 'Alamat Domisili';
      status = 'Status Keluarga';
      gender = 'Gender';
    } else {
      if (userData[0].dateBirth != null) {
        dateBirth = userData[0].dateBirth!;
      } else {
        dateBirth = 'Tanggal Lahir';
      }
      if (userData[0].name != null) {
        name = userData[0].name!;
      } else {
        name = 'Nama Lengkap Pemesan';
      }
      if (userData[0].nik != null) {
        nik = userData[0].nik!;
      } else {
        nik = 'Nomor NIK';
      }
      if (userData[0].placeBirth != null) {
        placeBirth = userData[0].placeBirth!;
      } else {
        placeBirth = 'Tempat Lahir';
      }
      if (userData[0].email != null) {
        email = userData[0].email!;
      } else {
        email = 'Alamat Email';
      }
      if (userData[0].phone != null) {
        phone = userData[0].phone!;
      } else {
        phone = 'No hp';
      }
      if (userData[0].idCardAddress != null) {
        idCardAddress = userData[0].idCardAddress!;
      } else {
        idCardAddress = 'Alamat Berdasarkan KTP';
      }
      if (userData[0].address != null) {
        address = userData[0].address!;
      } else {
        address = 'Alamat Domisili';
      }
      if (userData[0].statusFamily != null) {
        status = userData[0].statusFamily!.toLowerCase();
      } else {
        status = 'Status Keluarga';
      }
      if (userData[0].gender != null) {
        gender = userData[0].gender!.toLowerCase();
      } else {
        gender = 'Gender';
      }
    }
  }
}
