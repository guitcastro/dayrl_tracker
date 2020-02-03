# Firebase Bloc Analytics

Use the Firebase Analytics with the package Flutter Bloc Analytics.

## Usage instructions

### Registering your tracker

``` Dart
final firebaseAnalytics =  FirebaseAnalytics();

Tracker tracker = FirebaseTracker(firebaseAnalytics);
```

#### Tracking User ID

``` Dart
tracker.setUserId("97e7d993-745a-455f-aeac-0d04d5f0a035");
```

#### Tracking event

``` Dart
final myEvent = AnalyticsEvent(
    name: 'login',
    parameters: {
      'method': 'Flutter',
    },
);

tracker.logEvent(myEvent);
```

#### Tracking page view

``` Dart
tracker.logPageView("MyPage");
```

#### Logging user properties

``` Dart
tracker.setUserProperty(
  Constants.USER_PROPERTY_VIP, false,
);
```
