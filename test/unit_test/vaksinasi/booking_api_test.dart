import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vaccine_booking/model/vaksinasi/api/booking_api.dart';
import 'package:vaccine_booking/model/vaksinasi/booking_model.dart';

import 'booking_api_test.mocks.dart';

@GenerateMocks([BookingApi])
void main() {
  group(
    'Booking API',
    () {
      BookingApi bookingApi = MockBookingApi();
      test(
        "Get Bookings",
        () async {
          when(
            bookingApi.getBooking(),
          ).thenAnswer(
            (_) => <BookingModel>[
              BookingModel(
                bookingDate: "dd-MM-yyyy HH:mm:ss",
                schedule: {
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
                },
                user: {
                  "email": "string",
                  "id": 0,
                  "name": "string",
                  "password": "string",
                  "profile": {"role": "ADMIN", "user_id": 0},
                },
              ),
            ],
          );
          final List<BookingModel> getBookings = await bookingApi.getBooking();
          expect(getBookings.isNotEmpty, true);
        },
      );
    },
  );
}
