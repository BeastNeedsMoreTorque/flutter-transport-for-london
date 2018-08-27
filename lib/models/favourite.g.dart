// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Favourite _$FavouriteFromJson(Map<String, dynamic> json) =>
    new Favourite(name: json['name'] as String, path: json['path'] as String);

abstract class _$FavouriteSerializerMixin {
  String get name;
  String get path;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'path': path};
}
