import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockTracker extends Mock implements Tracker {}

void main() {
  Tracker subject;
  Tracker tracker1;
  Tracker tracker2;

  setUp(() {
    tracker2 = MockTracker();
    tracker1 = MockTracker();
    subject = MultipleTracker([tracker1, tracker2]);
  });

  test('logEvent', () {
    final event = AnalyticsEvent(name: 'test');
    subject.logEvent(event);
    verify(tracker1.logEvent(event));
    verify(tracker2.logEvent(event));
  });

  test('logPageView', () {
    final pageName = 'test';
    subject.logPageView(pageName);
    verify(tracker1.logPageView(pageName));
    verify(tracker2.logPageView(pageName));
  });

  test('setUserProperty', () {
    final property = 'key';
    final value = 'value';
    subject.setUserProperty(property, value);
    verify(tracker1.setUserProperty(property, value));
    verify(tracker2.setUserProperty(property, value));
  });
}
