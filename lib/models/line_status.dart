import 'package:json_annotation/json_annotation.dart';

part 'line_status.g.dart';

@JsonSerializable()
class LineStatus extends Object with _$LineStatusSerializerMixin {
  LineStatus({
    this.id,
    this.statusSeverity,
    this.statusSeverityDescription,
    this.created,
    this.validityPeriods,
  });

  int id;
  int statusSeverity;
  String statusSeverityDescription;
  DateTime created;
  List validityPeriods;

  factory LineStatus.fromJson(Map<String, dynamic> json) {
    return _$LineStatusFromJson(json);
  }
}
