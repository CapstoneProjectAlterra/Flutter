class BookingModel {
  int? id;
  String bookingDate;
  Map<String, dynamic> schedule;
  Map<String, dynamic> user;

  BookingModel(
      {required this.bookingDate,
      required this.schedule,
      required this.user,
      this.id});

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
      bookingDate: json['booking_date'],
      schedule: json['schedule'],
      user: json['user'],
      id: json['id']);

  Map<String, dynamic> toJson() =>
      {'booking_date': bookingDate, 'schedule': schedule, 'user': user};
}
