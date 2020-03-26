import 'analytics_event.dart';
import 'tracker.dart';

/// A tracker that allow you to use different services at once
class MultipleTracker implements Tracker {
  const MultipleTracker(this.trackers);

  final Iterable<Tracker> trackers;

  void logPageView(String name) {
    trackers.forEach((t) => t.logPageView(name));
  }

  void logEvent(AnalyticsEvent event) {
    trackers.forEach((t) => t.logEvent(event));
  }

  void setUserProperty(String key, Object any) {
    trackers.forEach((t) => t.setUserProperty(key, any));
  }

  void setUserId(String id) {
    trackers.forEach((t) => t.setUserId(id));
  }
}
