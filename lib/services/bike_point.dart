import 'dart:async';

import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/repos/bike_point.dart';

class BikePointService {
  BikePointService(this._bikePointRepo);

  final BikePointRepo _bikePointRepo;

  Future<Place> getBikePointByBikePointId(
    String bikePointId,
  ) async {
    return _bikePointRepo.getBikePointByBikePointId(bikePointId);
  }

  Future<List<Place>> getBikePoints() async {
    return _bikePointRepo.getBikePoints();
  }
}
