class BookingModel {
  String bookingDate;
  String bookingPass;
  Map<String, dynamic> schedule;
  Map<String, dynamic> user;

  BookingModel(
      {required this.bookingDate,
      required this.bookingPass,
      required this.schedule,
      required this.user});

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        bookingDate: json['booking_date'],
        bookingPass: json['booking_pass'],
        schedule: json['schedule'],
        user: json['user'],
      );

  Map<String, dynamic> toJson() => {
        'booking_date': bookingDate,
        'booking_pass': bookingPass,
        'schedule': schedule,
        'user': user
      };
}
