import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_bloc_analytics/src/firebase_tracker.dart';

class LogTracker implements Tracker {
  void logPageView(String name) {
    print('PageView $name logged');
  }

  void logEvent(AnalyticsEvent event) {
    print('Event ${event.name} logged');
  }

  void setUserProperty(String key, Object any) {
    print('Update user property $key with value $any.');
  }

  void setUserId(String id) {
    print('The user id is $id.');
  }
}

void main() {
  final tracker = MultipleTracker(
    [
      FirebaseTracker(FirebaseAnalytics()),
      LogTracker(),
    ],
  );

  tracker.setUserId("97e7d993-745a-455f-aeac-0d04d5f0a035");

  tracker.logEvent(
    AnalyticsEvent(name: 'test', parameters: {'propertyName': 'value'}),
  );

  tracker.logPageView('page');

  tracker.setUserProperty('a property', 'value');
}
