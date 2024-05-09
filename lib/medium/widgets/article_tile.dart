import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/medium/data/models/medium_article.dart';
import 'package:portfolio/medium/widgets/read_article_button.dart';
import 'package:portfolio/theme/typography.dart';

class ArticleTile extends StatefulWidget {
  const ArticleTile({
    super.key,
    required this.article,
  });

  final MediumArticle article;

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  MediumArticle get article => widget.article;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (deviceWidth >= 920) ...[
          Expanded(
            flex: 2,
            child: LayoutBuilder(
              builder: (context, constraints) => article.thumbnailUrl != null
                  ? SizedBox(
                      width: constraints.maxWidth,
                      child: Image.network(
                        article.thumbnailUrl!,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image),
                        loadingBuilder: (context, child, loadingProgress) =>
                            (loadingProgress?.expectedTotalBytes ?? 0) <=
                                    (loadingProgress?.cumulativeBytesLoaded ??
                                        0)
                                ? child
                                : const CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(width: 16),
        ],
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (deviceWidth < 920)
                LayoutBuilder(
                  builder: (context, constraints) => article.thumbnailUrl !=
                          null
                      ? SizedBox(
                          width: constraints.maxWidth / getDivisor(deviceWidth),
                          child: Image.network(
                            article.thumbnailUrl!,
                          ),
                        )
                      : const SizedBox(),
                ),
              Text(
                article.title!,
                style: AppTypography.bodyTextstyle2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                    .format(article.pubDate!),
                style: AppTypography.lightBodyTextstyle,
              ),
              const SizedBox(height: 8),
              LaunchArticleButton(url: article.link!)
            ],
          ),
        ),
      ],
    );
  }

  double getDivisor(double deviceWidth) => switch (deviceWidth) {
        > 720 => 1.2,
        > 500 => 1.6,
        > 400 => 1.4,
        > 300 => 1.2,
        _ => 1,
      };
}
