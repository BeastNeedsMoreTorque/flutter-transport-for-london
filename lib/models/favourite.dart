import 'package:json_annotation/json_annotation.dart';

part 'favourite.g.dart';

@JsonSerializable()
class Favourite {
  Favourite({this.name, this.path});

  final String name;
  final String path;

  factory Favourite.fromJson(Map<String, dynamic> json) {
    return _$FavouriteFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FavouriteToJson(this);
  }
}
