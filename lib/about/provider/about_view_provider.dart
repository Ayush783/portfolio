import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aboutProvider = ChangeNotifierProvider((_) => AboutNotifier());

class AboutNotifier extends ChangeNotifier {
  int _textIndex = 0;
  int get textIndex => _textIndex;

  void incrementTextIndex() {
    _textIndex++;
    _textIndex %= 6;
    notifyListeners();
  }

  getRecentMediumArticle() {}
}
