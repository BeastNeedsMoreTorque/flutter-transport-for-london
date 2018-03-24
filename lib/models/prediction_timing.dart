import 'package:json_annotation/json_annotation.dart';

part 'prediction_timing.g.dart';

@JsonSerializable()
class PredictionTiming extends Object with _$PredictionTimingSerializerMixin {
  PredictionTiming({
    this.countdownServerAdjustment,
    this.source,
    this.insert,
    this.read,
    this.sent,
    this.received,
  });

  String countdownServerAdjustment;
  DateTime source;
  DateTime insert;
  DateTime read;
  DateTime sent;
  DateTime received;

  factory PredictionTiming.fromJson(Map<String, dynamic> json) {
    return _$PredictionTimingFromJson(json);
  }
}
