import 'dart:async';

import 'package:transport_for_london/io/http.dart';
import 'package:transport_for_london/mappings/place.dart';
import 'package:transport_for_london/models/place.dart';
import 'package:transport_for_london/repos/bike_point.dart';

class ProdBikePointRepo implements BikePointRepo {
  ProdBikePointRepo(this._http);

  final AppHttp _http;

  @override
  Future<Place> getBikePointByBikePointId(
    String bikePointId,
  ) async {
    return mapToPlace(
      await _http.get('/BikePoint/${bikePointId}'),
    );
  }

  @override
  Future<List<Place>> getBikePoints() async {
    return mapToPlaces(
      await _http.get('/BikePoint'),
    );
  }
}
