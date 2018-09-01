import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/utils/place.dart';

Place mapToPlace(dynamic value) {
  return new Place.fromJson(value);
}

List<Place> mapToPlaces(List<dynamic> values) {
  List<Place> places = values.map(mapToPlace).toList();

  places.sort(sortPlaces);

  return places;
}
