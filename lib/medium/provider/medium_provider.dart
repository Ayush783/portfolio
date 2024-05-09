import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/medium/data/models/medium_article.dart';
import 'package:portfolio/medium/data/repo/medium_repo.dart';

final mediumProvider = FutureProvider<List<MediumArticle>>((ref) async {
  final articles = await MediumRepo().getRecentMediumArticles();
  return articles;
});
