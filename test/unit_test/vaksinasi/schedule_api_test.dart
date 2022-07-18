import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vaccine_booking/model/vaksinasi/api/schedule_api.dart';
import 'package:vaccine_booking/model/vaksinasi/schedule_model.dart';

import 'schedule_api_test.mocks.dart';

@GenerateMocks([ScheduleApi])
void main() {
  group(
    'Schedule API',
    () {
      ScheduleApi scheduleApi = MockScheduleApi();
      test(
        'Get Schedules',
        () async {
          when(scheduleApi.getAllSchedules()).thenAnswer(
            (_) async => <ScheduleModel>[
              ScheduleModel(
                id: 1,
                vaccinationDate: "18-07-2022",
                operationalHourStart: "11:02:29",
                operationalHourEnd: "11:02:30",
                quota: 100,
                dose: "BOOSTER",
                facility: {
                  "id": 2,
                  "facility_name": "RS Permata Ibu",
                  "street_name": "Jl Anggrek",
                  "office_number": "123",
                  "village_name": "Sukmajaya",
                  "district": "Beji",
                  "city": "Depok",
                  "province": "Jawa Barat",
                  "postal_code": 123,
                  "image": null,
                  "profile": {"user_id": 4, "role": "ADMIN"},
                },
                vaccine: {"id": 1, "vaccine_name": "SINOPHARM"},
              ),
            ],
          );
          final List<ScheduleModel> schedules =
              await scheduleApi.getAllSchedules();
          expect(schedules.isNotEmpty, true);
        },
      );
    },
  );
}
