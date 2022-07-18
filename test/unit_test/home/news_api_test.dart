import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vaccine_booking/model/home/api/news_api.dart';
import 'package:vaccine_booking/model/home/news_model.dart';

import 'news_api_test.mocks.dart';

@GenerateMocks([NewsApi])
void main() {
  group(
    'News API',
    () {
      NewsApi newsApi = MockNewsApi();
      test(
        'Get News',
        () async {
          when(
            newsApi.getAllNews(),
          ).thenAnswer(
            (_) async => <NewsModel>[
              NewsModel(
                  author: "String",
                  title: "String",
                  urlToImage: "String",
                  content: "String",
                  description: "String",
                  publishedAt: "String",
                  url: "String"),
            ],
          );
          final List<NewsModel> getNews = await newsApi.getAllNews();
          expect(getNews.isNotEmpty, true);
        },
      );
    },
  );
}
