import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

/// Firebase implementation of Tracker
class FirebaseTracker implements Tracker {
  const FirebaseTracker(this.analytics);

  final FirebaseAnalytics analytics;

  @override
  void logEvent(AnalyticsEvent event) {
    final sanitizedParameters = event.parameters == null
        ? null
        : event.parameters.map((key, value) => MapEntry(_sanitize(key), value));
    analytics
        .logEvent(name: _sanitize(event.name), parameters: sanitizedParameters)
        .then((onValue) => print('Event ${event.name} logged'));
  }

  @override
  void logPageView(String name) {
    analytics
        .setCurrentScreen(screenName: _sanitize(name))
        .then((onValue) => print('PageView $name logged'));
  }

  @override
  void setUserProperty(String key, Object value) {
    analytics
        .setUserProperty(name: _sanitize(key), value: _sanitize(value))
        .then((onValue) => print('Update user property'));
    ;
  }

  String _sanitize(final Object value) {
    return ('' + value)
        .replaceAll("/", "_")
        .replaceAll("-", "_")
        .replaceAll(" ", "_");
  }
}
