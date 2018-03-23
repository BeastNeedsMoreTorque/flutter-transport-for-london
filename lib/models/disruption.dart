import 'package:json_annotation/json_annotation.dart';

part 'disruption.g.dart';

@JsonSerializable()
class Disruption extends Object with _$DisruptionSerializerMixin {
  Disruption({
    this.category,
    this.type,
    this.categoryDescription,
    this.description,
    this.affectedRoutes,
    this.affectedStops,
    this.closureText,
  });

  String category;
  String type;
  String categoryDescription;
  String description;
  List affectedRoutes;
  List affectedStops;
  String closureText;

  factory Disruption.fromJson(Map<String, dynamic> json) {
    return _$DisruptionFromJson(json);
  }
}
