# Flutter Bloc Analytics

Use multiple analytics and other trackers in your Application easily 

## Supported trackers:

* Firebase

## Usages instructions

### Registering your trackers

#### Firebase

```
final firebaseTracker =  FirebaseAnalytics();
```

### Registering multiple trackers

```
MultipleTracker tracker =  MultipleTracker([firebase, crashlytics]);
```

### Starting Tracking 

After all trackers are registered you can just use the multiple tracker to track all events at once

#### Tracking event

```
tracker.logEvent(myEvent);
```

#### Tracking page view

```
tracker.logPageView("page name");
```

#### Logging user properties

Avaibles for : Firebase

```
tracker.setUserProperty(Constants.USER_PROPERTY_EMAIL, "example@gmail.com");
```

## Creating custom tracker

In oder to create a custom tracker you just need to implement the `Tracker` interface.

