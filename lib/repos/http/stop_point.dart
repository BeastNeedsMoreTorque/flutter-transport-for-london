import 'dart:async';

import 'package:transport_for_london/mappings/stop_point.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/repos/http/http.dart';
import 'package:transport_for_london/repos/stop_point.dart';

class HttpStopPointRepo extends Http implements StopPointRepo {
  @override
  Future<List<Prediction>> getPredictionsByStopPointId(
    String stopPointId,
  ) async {
    return mapToPredictions(
      await get('/StopPoint/$stopPointId/Arrivals'),
    );
  }

  @override
  Future<StopPoint> getStopPointByStopPointId(
    String stopPointId,
  ) async {
    return mapToStopPoint(
      await get('/StopPoint/$stopPointId'),
    );
  }

  @override
  Future<List<StopPoint>> getStopPointsByType([
    String type = 'NaptanMetroStation',
  ]) async {
    return mapToStopPoints(
      await get('/StopPoint/Type/$type'),
    );
  }
}