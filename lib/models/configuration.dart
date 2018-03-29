import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/stop_point.dart';

part 'configuration.g.dart';

@JsonSerializable()
class Configuration extends Object with _$ConfigurationSerializerMixin {
  Configuration({this.home, this.work});

  final StopPoint home;
  final StopPoint work;

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return _$ConfigurationFromJson(json);
  }

  Configuration copyWith({StopPoint home, StopPoint work}) {
    return new Configuration(
      home: home ?? this.home,
      work: work ?? this.work,
    );
  }
}
