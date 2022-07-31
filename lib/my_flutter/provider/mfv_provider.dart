import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mfvProvider = ChangeNotifierProvider((ref) => MFVNotifier());

class MFVNotifier extends ChangeNotifier {
  int _tIndex = 0;
  int get tIndex => _tIndex;

  void incrementTIndex() {
    _tIndex++;
    _tIndex %= 3;
    notifyListeners();
  }
}
