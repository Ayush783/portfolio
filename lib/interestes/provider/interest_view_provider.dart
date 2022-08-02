import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ivProvider = ChangeNotifierProvider((ref) => IVNotifier());

class IVNotifier extends ChangeNotifier {
  bool _onscreen = false;
  bool get onscreen => _onscreen;

  void animatePage() {
    _onscreen = true;
    notifyListeners();
  }

  int _tIndex = 0;
  int get tIndex => _tIndex;

  void incrementTIndex() {
    _tIndex++;
    _tIndex %= 5;
    notifyListeners();
  }
}
