import 'analytics_event.dart';
import 'tracker.dart';

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
}