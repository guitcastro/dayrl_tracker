import 'analytics_event.dart';

/// Interface that define an analytics tracker
abstract class Tracker {
  void logPageView(String name);
  void logEvent(AnalyticsEvent event);
  void setUserProperty(String key, Object any);
}
