import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/medium/provider/medium_provider.dart';
import 'package:portfolio/medium/widgets/article_tile.dart';
import 'package:portfolio/medium/widgets/article_tile_shimmer.dart';

class RecentMediumArticlePlaceholder extends ConsumerWidget {
  const RecentMediumArticlePlaceholder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(mediumProvider).when(
          data: (data) => data.isNotEmpty
              ? ArticleTile(article: data.first)
              : const SizedBox(),
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const ArticleTileShimmer(),
        );
  }
}
