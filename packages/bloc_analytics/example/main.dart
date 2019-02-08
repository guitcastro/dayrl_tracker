import 'package:bloc_analytics/bloc_analytics.dart';

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
  final tracker = MultipleTracker([ExampleTracker()]);
  tracker.logEvent(
      AnalyticsEvent(name: 'test', parameters: {'propertyName': 'value'}));

  tracker.logPageView('page');

  tracker.setUserProperty('a property', 'value');
}
