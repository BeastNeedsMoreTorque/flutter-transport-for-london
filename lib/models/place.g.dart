// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => new Place(
    id: json['id'] as String,
    url: json['url'] as String,
    commonName: json['commonName'] as String,
    placeType: json['placeType'] as String,
    additionalProperties: (json['additionalProperties'] as List)
        ?.map((e) => e == null
            ? null
            : new AdditionalProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    children: json['children'] as List,
    childrenUrls: json['childrenUrls'] as List,
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble());

abstract class _$PlaceSerializerMixin {
  String get id;
  String get url;
  String get commonName;
  String get placeType;
  List<AdditionalProperty> get additionalProperties;
  List<dynamic> get children;
  List<dynamic> get childrenUrls;
  double get lat;
  double get lon;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'url': url,
        'commonName': commonName,
        'placeType': placeType,
        'additionalProperties': additionalProperties,
        'children': children,
        'childrenUrls': childrenUrls,
        'lat': lat,
        'lon': lon
      };
}
