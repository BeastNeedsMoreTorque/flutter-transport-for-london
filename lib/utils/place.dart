import 'package:transport_for_london/models/place.dart';

int sortPlaces(Place a, Place b) {
  return a.commonName.compareTo(b.commonName);
}
