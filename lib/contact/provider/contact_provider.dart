import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactProvider = ChangeNotifierProvider((ref) => ContactNotifier());

class ContactNotifier extends ChangeNotifier {
  bool _onScreen = false;
  bool get onScreen => _onScreen;

  void animatePage() {
    _onScreen = true;
    notifyListeners();
  }
}
