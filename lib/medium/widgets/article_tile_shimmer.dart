import 'dart:async';

import 'package:flutter/material.dart';

class ArticleTileShimmer extends StatefulWidget {
  const ArticleTileShimmer({super.key});

  @override
  State<ArticleTileShimmer> createState() => _ArticleTileShimmerState();
}

class _ArticleTileShimmerState extends State<ArticleTileShimmer> {
  bool animate = false;
  Timer? _timer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
        animate = !animate;
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (deviceWidth >= 920) ...[
          Expanded(
            flex: 2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 120,
              color: Colors.grey.withOpacity(animate ? 0.3 : 0.5),
            ),
          ),
          const SizedBox(width: 16),
        ],
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (deviceWidth < 920) ...[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 120,
                  color: Colors.grey.withOpacity(animate ? 0.3 : 0.5),
                ),
                const SizedBox(height: 4),
              ],
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 24,
                color: Colors.grey.withOpacity(animate ? 0.3 : 0.5),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 18,
                width: 120,
                color: Colors.grey.withOpacity(animate ? 0.3 : 0.5),
              ),
              const SizedBox(height: 8),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 60,
                width: 150,
                color: Colors.grey.withOpacity(animate ? 0.3 : 0.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
