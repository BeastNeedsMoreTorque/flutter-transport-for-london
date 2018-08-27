import 'package:json_annotation/json_annotation.dart';

part 'favourite.g.dart';

@JsonSerializable()
class Favourite extends Object with _$FavouriteSerializerMixin {
  Favourite({this.name, this.path});

  final String name;
  final String path;

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return _$FavouriteFromJson(json);
  }
}
