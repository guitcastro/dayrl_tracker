import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_bloc_analytics/src/firebase_tracker.dart';

class ExampleTracker implements Tracker {
  @override
  void logEvent(AnalyticsEvent event) {
    print(event);
  }

  @override
  void logPageView(String name) {
    print(name);
  }

  @override
  void setUserProperty(String key, Object any) {
    print(key);
  }
}

void main() {
  final tracker =
      MultipleTracker([FirebaseTracker(FirebaseAnalytics()), ExampleTracker()]);
  tracker.logEvent(
      AnalyticsEvent(name: 'test', parameters: {'propertyName': 'value'}));

  tracker.logPageView('page');

  tracker.setUserProperty('a property', 'value');
}
