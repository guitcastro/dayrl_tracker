class AnalyticsEvent {

  const AnalyticsEvent(this.name, this.parameters);

  factory AnalyticsEvent.named(String name) => AnalyticsEvent(name, {});

  final String name;
  final Map<String, dynamic> parameters;

  void putProperty(String propertyName, Object value) {
    parameters.putIfAbsent(propertyName, value);
  }
}