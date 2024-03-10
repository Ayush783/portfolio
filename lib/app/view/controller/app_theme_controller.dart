import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/theme/app_theme.dart';

final appThemeController =
    ChangeNotifierProvider((ref) => AppThemeController());

class AppThemeController extends ChangeNotifier {
  AppTheme _currentTheme = AppTheme.primary;
  AppTheme get currentTheme => _currentTheme;
  set currentTheme(AppTheme newTheme) {
    _currentTheme = newTheme;
    notifyListeners();
  }
}
