import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

/// Firebase implementation of Tracker
class FirebaseTracker implements Tracker {
  const FirebaseTracker(this.analytics);

  final FirebaseAnalytics analytics;

  void logEvent(AnalyticsEvent event) {
    final sanitizedParameters = event.parameters == null
        ? null
        : event.parameters.map((key, value) => MapEntry(_sanitize(key), value));

    analytics.logEvent(
      name: _sanitize(event.name),
      parameters: sanitizedParameters,
    );
  }

  void logPageView(String name) {
    analytics.setCurrentScreen(
      screenName: _sanitize(name),
    );
  }

  void setUserProperty(String key, Object value) {
    analytics.setUserProperty(
      name: _sanitize(key),
      value: _sanitize(value),
    );
  }

  void logLogin(String method) {
    analytics.logEvent(
      name: 'login',
      parameters: {
        'method': _sanitize(method),
      },
    );
  }

  void logSignUp(String method) {
    analytics.logEvent(
      name: 'sign_up',
      parameters: {
        'method': _sanitize(method),
      },
    );
  }

  void setUserId(String id) {
    analytics.setUserId(id);
  }

  String _sanitize(final Object value) {
    return ('' + value)
        .replaceAll("/", "_")
        .replaceAll("-", "_")
        .replaceAll(" ", "_");
  }
}
