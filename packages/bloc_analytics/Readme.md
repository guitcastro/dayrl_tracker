# Flutter Bloc Analytics

Use multiple analytics and other trackers in your Application easily

## Supported trackers

* Firebase

## Usages instructions

### Registering your trackers

#### Firebase

```dart
final firebaseTracker =  FirebaseAnalytics();
```

### Registering multiple trackers

```dart
MultipleTracker tracker =  MultipleTracker([firebase, crashlytics]);
```

### Starting Tracking

After all trackers are registered you can just use the multiple tracker to track all events at once

#### Tracking User ID

Available for: Firebase

```dart
tracker.setUserId("97e7d993-745a-455f-aeac-0d04d5f0a035");
```

#### Tracking event

```dart
tracker.logEvent(myEvent);
```

#### Tracking page view

```dart
tracker.logPageView("page name");
```

#### Logging user properties

Available for: Firebase

```dart
tracker.setUserProperty(
  Constants.USER_PROPERTY_EMAIL, "example@gmail.com",
);
```

## Creating custom tracker

In oder to create a custom tracker you just need to implement the `Tracker` interface.

## Login the inputs

In order to log the analytics methods just creat a new tracker.

### LogTracker

```dart
class LogTracker implements Tracker {
  void logPageView(String name) {
    print('PageView $name logged');
  }

  void logEvent(AnalyticsEvent event) {
    print('Event ${event.eventName} logged');
  }

  void setUserProperty(String key, Object any) {
    print('Update user property $key with value $any.');
  }

  void setUserId(String id) {
    print('The user ID is $id.');
  }
}
```

### Register the LogTracker

```dart
MultipleTracker tracker =  MultipleTracker(
  [
    firebase,
    LogTracker(),
  ]
);
```
