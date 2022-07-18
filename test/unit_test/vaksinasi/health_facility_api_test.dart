import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vaccine_booking/model/vaksinasi/api/health_facility_api.dart';
import 'package:vaccine_booking/model/vaksinasi/health_facility_model.dart';

import 'health_facility_api_test.mocks.dart';

@GenerateMocks([HealthFacilityApi])
void main() {
  group(
    'Health Facility API',
    () {
      HealthFacilityApi healthFacilityApi = MockHealthFacilityApi();
      test(
        "het Health of Facilities",
        () async {
          when(
            healthFacilityApi.getAllHealthFacilities(),
          ).thenAnswer(
            (_) => <HealthFacilityModel>[
              HealthFacilityModel(
                  city: "string",
                  district: "string",
                  facilityName: "string",
                  id: 0,
                  image: {
                    "base64": "string",
                    "content_type": "string",
                    "facility_id": 0
                  },
                  officeNumber: "string",
                  postalCode: 0,
                  province: "string",
                  streetName: "string",
                  villageName: "string")
            ],
          );
          final List<HealthFacilityModel> healthFacilities =
              await healthFacilityApi.getAllHealthFacilities();
          expect(healthFacilities.isNotEmpty, true);
        },
      );
    },
  );
}
