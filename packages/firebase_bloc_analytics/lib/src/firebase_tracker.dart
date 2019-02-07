import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseTracker implements Tracker {
  const FirebaseTracker(this.analytics);

  final FirebaseAnalytics analytics;

  @override
  void logEvent(AnalyticsEvent event) {
    analytics.logEvent(name: event.name, parameters: event.parameters);
  }

  @override
  void logPageView(String name) {
    analytics.setCurrentScreen(screenName: name);
  }

  @override
  void setUserProperty(String key, Object value) {
    analytics.setUserProperty(name: key, value: value);
  }
}
