import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/disruption.dart';
import 'package:transport_for_london/models/validity_period.dart';

part 'line_status.g.dart';

@JsonSerializable()
class LineStatus extends Object with _$LineStatusSerializerMixin {
  LineStatus({
    this.id,
    this.lineId,
    this.statusSeverity,
    this.statusSeverityDescription,
    this.reason,
    this.created,
    this.validityPeriods,
    this.disruption,
  });

  int id;
  String lineId;
  int statusSeverity;
  String statusSeverityDescription;
  String reason;
  DateTime created;
  List<ValidityPeriod> validityPeriods;
  Disruption disruption;

  factory LineStatus.fromJson(Map<String, dynamic> json) {
    return _$LineStatusFromJson(json);
  }
}
