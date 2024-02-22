import 'package:flutter/material.dart';

abstract class AppTheme {
  static final AppTheme primary = _PrimaryTheme();

  ThemeData get theme;
}

class _PrimaryTheme implements AppTheme {
  @override
  ThemeData get theme => ThemeData();
}
