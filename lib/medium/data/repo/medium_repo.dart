import 'package:portfolio/medium/data/models/medium_article.dart';
import 'package:portfolio/services/network/dio_service.dart';

class MediumRepo {
  final DioService _dioService = DioService();
  static const MEDIUM_ARTICLES_BY_USER =
      'https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@Ayush_B58';

  Future<List<MediumArticle>> getRecentMediumArticles() async {
    final response = await _dioService.get(MEDIUM_ARTICLES_BY_USER);
    return (response.data['items'] as List)
        .map((e) => MediumArticle.fromMap(e))
        .toList();
  }
}
