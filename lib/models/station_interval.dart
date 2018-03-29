import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/interval.dart';

part 'station_interval.g.dart';

@JsonSerializable()
class StationInterval extends Object with _$StationIntervalSerializerMixin {
  StationInterval({
    this.id,
    this.intervals,
  });

  String id;
  List<Interval> intervals;

  factory StationInterval.fromJson(Map<String, dynamic> json) {
    return _$StationIntervalFromJson(json);
  }
}
