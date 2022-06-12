import 'package:dio/dio.dart';
import 'package:vaccine_booking/model/home/news_model.dart';

class NewsApi {
  Future<List<NewsModel>> getAllNews() async {
    final response = await Dio().get(
        "https://vaccine-booking-52e29-default-rtdb.firebaseio.com/news.json");
    final newsList = (response.data as List)
        .map(
          (e) => NewsModel.fromJson(e),
        )
        .toList();

    return newsList;
  }
}
