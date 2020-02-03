import 'package:meta/meta.dart';

/// A class that represent an analytics event to track
/// You can either use this direct or implement it in your custom events
class AnalyticsEvent {
  const AnalyticsEvent({
    @required this.name,
    this.parameters,
  });

  /// Analytics event name
  final String name;

  /// Analytics event properties
  final Map<String, dynamic> parameters;
}
