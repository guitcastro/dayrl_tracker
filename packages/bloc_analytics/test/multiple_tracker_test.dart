import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockTracker extends Mock implements Tracker {}

void main() {
  Tracker subject;
  Tracker tracker1;
  Tracker tracker2;

  setUp(() {
    tracker1 = MockTracker();
    tracker2 = MockTracker();
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

  test('logLogin', () {
    final id = '97e7d993-745a-455f-aeac-0d04d5f0a035';

    subject.setUserId(id);

    verify(tracker1.setUserId(id));
    verify(tracker2.setUserId(id));
  });
}
