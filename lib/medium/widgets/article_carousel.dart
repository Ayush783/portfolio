import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/medium/data/models/medium_article.dart';
import 'package:portfolio/medium/provider/medium_provider.dart';
import 'package:portfolio/medium/widgets/article_tile_shimmer.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:portfolio/utils/firebase_analytics_service.dart';
import 'package:portfolio/utils/url_launcher_util.dart';

class ArticleCarousel extends ConsumerStatefulWidget {
  const ArticleCarousel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ArticleCarouselState();
}

class _ArticleCarouselState extends ConsumerState<ArticleCarousel> {
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  double getTileAspectRatio(double width) => switch (width) {
        < 480 => 9 / 8,
        < 720 => 9 / 12,
        _ => 9 / 16,
      };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final w = size.width;
    final h = size.height;
    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ref.watch(mediumProvider).when(
            data: (articles) => Column(
              children: [
                Semantics(
                  label: 'Blog Centre',
                  child: Text(
                    'Blog Centre',
                    style: AppTypography.boldHeadingTextstyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w / 8, vertical: h / 8),
                    child: GridView.builder(
                      itemCount: articles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: getTileAspectRatio(w),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          _ArticleCarouselTile(article: articles[index]),
                    ),
                  ),
                ),
              ],
            ),
            error: (error, stackTrace) => const Center(
              child: Text('Error fetching articles!'),
            ),
            loading: () => Padding(
              padding: EdgeInsets.symmetric(horizontal: w / 8, vertical: h / 8),
              child: const Center(
                child: ArticleTileShimmer(),
              ),
            ),
          ),
    );
  }
}

class _ArticleCarouselTile extends StatelessWidget {
  const _ArticleCarouselTile({
    super.key,
    required this.article,
  });

  final MediumArticle article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FirebaseAnalyticsService.logEvents('Opened Blog ${article.title}');
        UrlLaunchUtil.launch(article.link!);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      article.thumbnailUrl!,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 4),
            Semantics(
              label: article.title,
              child: AutoSizeText(
                article.title!,
                minFontSize: 14,
                style: AppTypography.boldBodyTextstyle,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Semantics(
              label: '${article.pubDate}',
              child: Text(
                DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                    .format(article.pubDate!),
                style: AppTypography.lightBodyTextstyle
                    .copyWith(fontSize: 12, color: Colors.grey.shade600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
