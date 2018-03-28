import 'package:json_annotation/json_annotation.dart';

part 'validity_period.g.dart';

@JsonSerializable()
class ValidityPeriod extends Object with _$ValidityPeriodSerializerMixin {
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
}
