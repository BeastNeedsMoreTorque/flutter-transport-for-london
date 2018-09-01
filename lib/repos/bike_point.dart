import 'dart:async';

import 'package:transport_for_london/models/place.dart';

abstract class BikePointRepo {
  Future<Place> getBikePointByBikePointId(
    String bikePointId,
  );

  Future<List<Place>> getBikePoints();
}
