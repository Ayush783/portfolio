import 'package:flutter/material.dart';

abstract class AppTheme {
  static final AppTheme primary = _PrimaryTheme();
  static final AppTheme lightOrange = _LightOrange();

  ThemeData get themeData;
}

class _PrimaryTheme implements AppTheme {
  @override
  ThemeData get themeData => ThemeData();
}

class _LightOrange implements AppTheme {
  // FCDEBE
  // D4D2A5
  // D0B89D
  @override
  ThemeData get themeData => ThemeData();
}

class _BabyPowder implements AppTheme {
  // ED1C24
  // FDFFFC
  // 235789
  @override
  ThemeData get themeData => ThemeData();
}

class _Wine implements AppTheme {
  // 6B2737
  // E08E45
  // F8F4A6
  // BDF7B7
  @override
  ThemeData get themeData => ThemeData();
}

class _DimGray implements AppTheme {
  // 7A7265
  // C0B7B1
  // 8E6E53
  // C69C72
  // 433E3F
  @override
  ThemeData get themeData => ThemeData();
}
