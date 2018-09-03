import 'package:json_annotation/json_annotation.dart';

part 'validity_period.g.dart';

@JsonSerializable()
class ValidityPeriod {
  ValidityPeriod({
    this.fromDate,
    this.toDate,
    this.isNow,
  });

  DateTime fromDate;
  DateTime toDate;
  bool isNow;

  factory ValidityPeriod.fromJson(Map<String, dynamic> json) {
    return _$ValidityPeriodFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ValidityPeriodToJson(this);
  }
}
