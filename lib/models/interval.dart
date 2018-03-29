import 'package:json_annotation/json_annotation.dart';

part 'interval.g.dart';

@JsonSerializable()
class Interval extends Object with _$IntervalSerializerMixin {
  Interval({
    this.stopId,
    this.timeToArrival,
  });

  String stopId;
  int timeToArrival;

  factory Interval.fromJson(Map<String, dynamic> json) {
    return _$IntervalFromJson(json);
  }
}
