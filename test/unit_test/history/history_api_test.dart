import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vaccine_booking/model/history/api/history_api.dart';
import 'package:vaccine_booking/model/history/history_model.dart';

import 'history_api_test.mocks.dart';

@GenerateMocks([HistoryApi])
void main() {
  group(
    'History API',
    () {
      HistoryApi historyApi = MockHistoryApi();
      test(
        'Get Detail Bookings',
        () async {
          when(
            historyApi.getDetailBooking(),
          ).thenAnswer(
            (_) => <HistoryModel>[
              HistoryModel(
                family: {
                  "date_of_birth": "dd-MM-yyyy",
                  "email": "string",
                  "gender": "LAKI_LAKI",
                  "id": 0,
                  "id_card_address": "string",
                  "name": "string",
                  "nik": "string",
                  "phone_number": "string",
                  "place_of_birth": "string",
                  "profile": {"role": "ADMIN", "user_id": 0},
                  "residence_address": "string",
                  "status_in_family": "ANAK"
                },
                booking: {
                  "booking_date": "dd-MM-yyyy HH:mm:ss",
                  "booking_pass": 0,
                  "id": 0,
                  "schedule": {
                    "dose": "BOOSTER",
                    "facility": {
                      "city": "string",
                      "district": "string",
                      "facility_name": "string",
                      "id": 0,
                      "image": {
                        "base64": "string",
                        "content_type": "string",
                        "facility_id": 0
                      },
                      "office_number": "string",
                      "postal_code": 0,
                      "profile": {"role": "ADMIN", "user_id": 0},
                      "province": "string",
                      "street_name": "string",
                      "village_name": "string"
                    },
                    "id": 0,
                    "operational_hour_end": "HH:mm:ss",
                    "operational_hour_start": "HH:mm:ss",
                    "quota": 0,
                    "vaccination_date": "dd-MM-yyyy",
                    "vaccine": {"id": 0, "vaccine_name": "string"}
                  },
                  "user": {
                    "email": "string",
                    "id": 0,
                    "name": "string",
                    "password": "string",
                    "profile": {"role": "ADMIN", "user_id": 0},
                    "username": "string"
                  }
                },
              ),
            ],
          );
          final List<HistoryModel> detailBookings =
              historyApi.getDetailBooking();
          expect(detailBookings.isNotEmpty, true);
        },
      );
    },
  );
}
