import 'package:bloc_analytics/bloc_analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_bloc_analytics/firebase_bloc_analytics.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api/test_api.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  Tracker subject;
  FirebaseAnalytics analytics = MockFirebaseAnalytics();

  setUp(() {
    subject = FirebaseTracker(analytics);
  });

  test('logEvent', () {
    final event = AnalyticsEvent.named('test event');
    subject.logEvent(event);
    verify(analytics.logEvent(name: 'test_event', parameters: {}));
  });

  test('logPageView', () {
    final pageName = 'test';
    subject.logPageView(pageName);
    verify(analytics.setCurrentScreen(screenName: pageName));
  });

  test('setUserProperty', () {
    final property = 'key';
    final value = 'value';
    subject.setUserProperty(property, value);
    verify(analytics.setUserProperty(name: property, value: value));
  });
}
