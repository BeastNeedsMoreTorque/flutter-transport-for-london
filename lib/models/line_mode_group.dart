import 'package:json_annotation/json_annotation.dart';

part 'line_mode_group.g.dart';

@JsonSerializable()
class LineModeGroup extends Object with _$LineModeGroupSerializerMixin {
  LineModeGroup({
    this.modeName,
    this.lineIdentifier,
  });

  String modeName;
  List<String> lineIdentifier;

  factory LineModeGroup.fromJson(Map<String, dynamic> json) {
    return _$LineModeGroupFromJson(json);
  }
}
