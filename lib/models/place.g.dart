// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
      id: json['id'] as String,
      url: json['url'] as String,
      commonName: json['commonName'] as String,
      placeType: json['placeType'] as String,
      additionalProperties: (json['additionalProperties'] as List)
          ?.map((e) => e == null
              ? null
              : AdditionalProperty.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      children: json['children'] as List,
      childrenUrls: json['childrenUrls'] as List,
      lat: (json['lat'] as num)?.toDouble(),
      lon: (json['lon'] as num)?.toDouble());
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'commonName': instance.commonName,
      'placeType': instance.placeType,
      'additionalProperties': instance.additionalProperties,
      'children': instance.children,
      'childrenUrls': instance.childrenUrls,
      'lat': instance.lat,
      'lon': instance.lon
    };
