class HistoryModel {
  Map<String, dynamic> family;
  Map<String, dynamic> booking;
  HistoryModel({required this.family, required this.booking});

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        family: json['family'],
        booking: json['booking'],
      );
}
