import 'package:bloc_analytics/bloc_analytics.dart';

class ExampleTracker implements Tracker {
  void logEvent(AnalyticsEvent event) {
    print(event);
  }

  void logPageView(String name) {
    print(name);
  }

  void setUserProperty(String key, Object any) {
    print(key);
  }

  void setUserId(String id) {
    print(id);
  }
}

void main() {
  final tracker = MultipleTracker([ExampleTracker()]);
  tracker.setUserId('97e7d993-745a-455f-aeac-0d04d5f0a035');

  tracker.logEvent(
    AnalyticsEvent(name: 'test', parameters: {'propertyName': 'value'}),
  );

  tracker.logPageView('page');

  tracker.setUserProperty('a property', 'value');
}
