import 'dart:async';

import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/repos/bike_point.dart';

class MockBikePointRepo implements BikePointRepo {
  @override
  Future<Place> getBikePointByBikePointId(String bikePointId) {
    // TODO: implement getBikePointByBikePointId
  }

  @override
  Future<List<Place>> getBikePoints() {
    // TODO: implement getBikePoints
  }
}
