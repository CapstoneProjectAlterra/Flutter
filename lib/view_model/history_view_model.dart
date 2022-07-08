import 'package:flutter/cupertino.dart';
import 'package:vaccine_booking/model/history/api/history_api.dart';
import 'package:vaccine_booking/model/history/history_model.dart';

class HistoryViewModel extends ChangeNotifier {
  List<HistoryModel> detailBookingList = [];
  List<HistoryModel> filterDetailBookingList = [];
  final historyApi = HistoryApi();

  getDetailBooking() async {
    final detailBooking = await historyApi.getDetailBooking();
    detailBookingList = detailBooking;
    notifyListeners();
  }

  filterDetailBooking(int id) async {
    filterDetailBookingList = detailBookingList
        .where((element) => element.booking['user']['id'] == id)
        .toList();
  }
}
