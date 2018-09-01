import 'dart:async';

import 'package:transport_for_london/mappings/stop_point.dart';
import 'package:transport_for_london/models/prediction.dart';
import 'package:transport_for_london/models/stop_point.dart';
import 'package:transport_for_london/io/http.dart';
import 'package:transport_for_london/repos/stop_point.dart';

class ProdStopPointRepo implements StopPointRepo {
  ProdStopPointRepo(this._http);

  final AppHttp _http;

  @override
  Future<List<Prediction>> getArrivalsByStopPointId(
    String stopPointId,
  ) async {
    return mapToPredictions(
      await _http.get(
        '/StopPoint/$stopPointId/Arrivals',
      ),
    );
  }

  @override
  Future<StopPoint> getStopPointByStopPointId(
    String stopPointId,
  ) async {
    return mapToStopPoint(
      await _http.get(
        '/StopPoint/$stopPointId',
      ),
    );
  }

  @override
  Future<List<StopPoint>> getStopPointsByModeName(
    String modeName,
  ) async {
    return mapToStopPoints(
      (await _http.get(
        '/StopPoint/Mode/${modeName}',
      ))['stopPoints'],
    );
  }

  @override
  Future<List<StopPoint>> getStopPointsByType(
    String type,
  ) async {
    return mapToStopPoints(
      await _http.get(
        '/StopPoint/Type/$type',
      ),
    );
  }
}
