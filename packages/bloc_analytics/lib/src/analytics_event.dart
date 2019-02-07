/// A class that represent an analytics event to track
/// You can either use this direct or implement it in your custom events
class AnalyticsEvent {
  const AnalyticsEvent(this.name, this.parameters);

  factory AnalyticsEvent.named(String name) => AnalyticsEvent(name, {});

  /// Analytics event name
  final String name;

  /// Analytics event properties
  final Map<String, dynamic> parameters;

  /// Insert a new property in event this is usually used with cascade parttern:
  /// ```
  /// AnalyticsEvent.named('myEvent')
  ///      ..putProperty('1', 'a')
  ///      ..putProperty('2', 'b')
  /// ```
  void putProperty(String propertyName, Object value) {
    parameters.putIfAbsent(propertyName, value);
  }
}
