import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vaccine_booking/model/home/api/news_api.dart';
import 'package:vaccine_booking/model/home/news_model.dart';

import '../model/home/news_model.dart';

class HomeViewModel extends ChangeNotifier {
  final newsApi = NewsApi();
  List<NewsModel> newsList = [];

  getAllNews() async {
    try {
      final getAllNews = await newsApi.getAllNews();
      newsList = getAllNews;
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
      );
    }
    notifyListeners();
  }
}
