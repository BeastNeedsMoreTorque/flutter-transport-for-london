import 'package:json_annotation/json_annotation.dart';

part 'line_group.g.dart';

@JsonSerializable()
class LineGroup {
  LineGroup({
    this.stationAtcoCode,
    this.lineIdentifier,
  });

  String stationAtcoCode;
  List<String> lineIdentifier;

  factory LineGroup.fromJson(Map<String, dynamic> json) {
    return _$LineGroupFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LineGroupToJson(this);
  }
}
