import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static final _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsService();

  static void logEvents(String eventName, {Map<String, dynamic>? data}) {
    try {
      _analytics.logEvent(name: eventName, parameters: data);
    } catch (e) {
      log('analytics error: $e');
    }
  }
}
