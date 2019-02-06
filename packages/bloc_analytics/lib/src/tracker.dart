import 'analytics_event.dart';

abstract class Tracker {
  void logPageView(String name);
  void logEvent(AnalyticsEvent event);
  void setUserProperty(String key, Object any);
}