import 'package:json_annotation/json_annotation.dart';
import 'package:transport_for_london/models/additional_property.dart';

part 'place.g.dart';

@JsonSerializable()
class Place extends Object with _$PlaceSerializerMixin {
  Place({
    this.id,
    this.url,
    this.commonName,
    this.placeType,
    this.additionalProperties,
    this.children,
    this.childrenUrls,
    this.lat,
    this.lon,
  });

  String id;
  String url;
  String commonName;
  String placeType;
  List<AdditionalProperty> additionalProperties;
  List children;
  List childrenUrls;
  double lat;
  double lon;

  factory Place.fromJson(Map<String, dynamic> json) {
    return _$PlaceFromJson(json);
  }
}
