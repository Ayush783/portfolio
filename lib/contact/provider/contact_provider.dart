import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactProvider = ChangeNotifierProvider((ref) => ContactNotifier());

class ContactNotifier extends ChangeNotifier {
  bool _onScreen = false;
  bool get onScreen => _onScreen;

  bool _animateForm = false;
  bool get animate => _animateForm;

  void animatePage() {
    _onScreen = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      _animateForm = true;
      notifyListeners();
    });
    notifyListeners();
  }
}
