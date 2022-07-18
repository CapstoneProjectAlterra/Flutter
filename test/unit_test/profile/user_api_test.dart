import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vaccine_booking/model/profile/api/user_api.dart';
import 'package:vaccine_booking/model/profile/family_model.dart';
import 'package:vaccine_booking/model/profile/user_model.dart';

import 'user_api_test.mocks.dart';

@GenerateMocks([UserApi])
void main() {
  group(
    'Profile API',
    () {
      UserApi userApi = MockUserApi();
      test(
        'Get Family members',
        () async {
          when(
            userApi.getAllFamilies(),
          ).thenAnswer(
            (_) => <FamilyModel>[
              FamilyModel(
                  id: 0,
                  name: "String",
                  nik: "String",
                  profile: {"role": "ADMIN", "user_id": 0},
                  email: "String",
                  statusFamily: "ANAK",
                  phone: "String",
                  gender: "LAKI_LAKI",
                  dateBirth: "String",
                  address: "String",
                  idCardAddress: "String",
                  placeBirth: "String"),
            ],
          );
          final List<FamilyModel> getFamilyMembers = userApi.getAllFamilies();
          expect(getFamilyMembers.isNotEmpty, true);
        },
      );
      test(
        'Get User',
        () async {
          when(
            userApi.getUserProfile(),
          ).thenAnswer(
            (_) => <UserModel>[
              UserModel(
                  profile: {"role": "ADMIN", "user_id": 0},
                  username: "string",
                  name: "string",
                  email: "string",
                  password: "string",
                  id: 0),
            ],
          );
        },
      );
    },
  );
}
